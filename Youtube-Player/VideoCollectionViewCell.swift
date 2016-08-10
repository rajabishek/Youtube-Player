//
//  VideoCollectionViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
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
        return imageView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.purpleColor()
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.darkGrayColor()
        return label
    }()
    
    let cellSeparator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.blackColor()
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = UIColor.yellowColor()
        
        addSubview(mainImageView)
        addSubview(profileImageView)
        addSubview(mainLabel)
        addSubview(subLabel)
        addSubview(cellSeparator)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += getConstraintsWithVisualFormat("H:|-16-[v0]-16-|", views: mainImageView)
        allConstraints += getConstraintsWithVisualFormat("V:|-16-[v0]-8-[v1(48)]-16-[v2(1)]|", views: mainImageView, profileImageView, cellSeparator)
        allConstraints += getConstraintsWithVisualFormat("H:|[v0]|", views: cellSeparator)
        
        allConstraints += getConstraintsWithVisualFormat("V:[v0(20)]", views: mainLabel)
        allConstraints += getConstraintsWithVisualFormat("V:[v0(30)]", views: subLabel)
        allConstraints += getConstraintsWithVisualFormat("H:|-16-[v0(48)]-8-[v1]-16-|", views: profileImageView, mainLabel)
        
        allConstraints.append(NSLayoutConstraint(item: mainLabel, attribute: .Top, relatedBy: .Equal, toItem: mainImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Top, relatedBy: .Equal, toItem: mainLabel, attribute: .Bottom, multiplier: 1, constant: 8))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Left, relatedBy: .Equal, toItem: profileImageView, attribute: .Right, multiplier: 1, constant: 8))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Right, relatedBy: .Equal, toItem: mainLabel, attribute: .Right, multiplier: 1, constant: 0))
        
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
    func getConstraintsWithVisualFormat(format: String, views: UIView...) -> [NSLayoutConstraint] {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerate() {
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary["v\(index)"] = view
        }
        
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary)
    }
}
