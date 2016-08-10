//
//  VideoCollectionViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: CustomCollectionViewCell {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blueColor()
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "banner")
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.redColor()
        imageView.layer.cornerRadius = 24
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Luke Cage | Official Trailer [HD] | Netflix"
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "In this Marvel live action series, a street-fighting ex-con battles crime on the streets"
        label.numberOfLines = 2
        label.font = UIFont(name: "AvenirNext-Regular", size: 12)
        label.textColor = Color.battleShipGray
        return label
    }()
    
    let cellSeparator: UIView = {
        let line = UIView()
        line.backgroundColor = Color.wildSand
        return line
    }()
    
    
    override func setupLayout() {
        
        super.setupLayout()
        
        addSubview(mainImageView)
        addSubview(profileImageView)
        addSubview(mainLabel)
        addSubview(subLabel)
        addSubview(cellSeparator)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|-16-[v0]-16-|", views: mainImageView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|-16-[v0]-8-[v1(48)]-16-[v2(1)]|", views: mainImageView, profileImageView, cellSeparator)
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: cellSeparator)
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(20)]", views: mainLabel)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(40)]", views: subLabel)
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|-16-[v0(48)]-8-[v1]-16-|", views: profileImageView, mainLabel)
        
        allConstraints.append(NSLayoutConstraint(item: mainLabel, attribute: .Top, relatedBy: .Equal, toItem: mainImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Top, relatedBy: .Equal, toItem: mainLabel, attribute: .Bottom, multiplier: 1, constant: 0))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Left, relatedBy: .Equal, toItem: profileImageView, attribute: .Right, multiplier: 1, constant: 8))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Right, relatedBy: .Equal, toItem: mainLabel, attribute: .Right, multiplier: 1, constant: 0))
        
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
