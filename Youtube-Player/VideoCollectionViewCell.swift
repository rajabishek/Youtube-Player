//
//  VideoCollectionViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: CustomCollectionViewCell {
    
    var video: Video! {
        didSet {
            mainImageView.image = UIImage(named: video.thumbnailImageName)
            profileImageView.image = UIImage(named: video.channel.profileImageName)
            
            mainLabel.text = video.title
            mainLabel.sizeToFit()
            
            let uploadDate = video.uploadDate.timeAgoSinceDate(true)
            
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .DecimalStyle
            if let numberOfViews = numberFormatter.stringFromNumber(video.numberOfViews) {
                subLabel.text = "\(video.channel.name) - \(numberOfViews) - \(uploadDate)"
            } else {
                subLabel.text = "\(video.channel.name) - \(uploadDate)"
            }
            subLabel.sizeToFit()
        }
    }
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blueColor()
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "banner")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.redColor()
        imageView.layer.cornerRadius = 24
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Luke Cage | Official Trailer [HD] | Netflix"
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "In this Marvel live action series, a street-fighting ex-con battles crime on the streets"
        label.font = UIFont(name: "AvenirNext-Regular", size: 12)
        label.textColor = Color.battleShipGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellSeparator: UIView = {
        let line = UIView()
        line.backgroundColor = Color.wildSand
        line.translatesAutoresizingMaskIntoConstraints = false
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
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|-16-[v0(48)]-8-[v1]-16-|", views: profileImageView, mainLabel)
        
        allConstraints.append(NSLayoutConstraint(item: mainLabel, attribute: .Top, relatedBy: .Equal, toItem: mainImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Top, relatedBy: .Equal, toItem: mainLabel, attribute: .Bottom, multiplier: 1, constant: 0))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Left, relatedBy: .Equal, toItem: mainLabel, attribute: .Left, multiplier: 1, constant: 0))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Right, relatedBy: .Equal, toItem: mainLabel, attribute: .Right, multiplier: 1, constant: 0))
        
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
