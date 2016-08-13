//
//  VideoCollectionViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import Kingfisher

class VideoCollectionViewCell: CustomCollectionViewCell {
    
    var video: Video! {
        didSet {
            
            if let thumbnailUrl = NSURL(string: video.thumbnailImageName) {
                mainImageView.kf_setImageWithURL(thumbnailUrl)
            }
            
            if let profileUrl = NSURL(string: video.channel.profileImageName) {
                profileImageView.kf_setImageWithURL(profileUrl)
            }
            
            mainLabel.text = video.title
            let uploadDate = video.uploadDate.timeAgoSinceDate(true)
            
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = .DecimalStyle
            if let numberOfViews = numberFormatter.stringFromNumber(video.numberOfViews) {
                subLabel.text = "\(video.channel.name) - \(numberOfViews) - \(uploadDate)"
            } else {
                subLabel.text = "\(video.channel.name) - \(uploadDate)"
            }
        }
    }
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGrayColor()
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "banner")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.darkGrayColor()
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
        label.font = UIFont(name: "FiraSans-Regular", size: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "In this Marvel live action series, a street-fighting ex-con battles crime on the streets"
        label.font = UIFont(name: "FiraSans-Light", size: 12)
        label.numberOfLines = 2
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
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|-16-[v0(150)]-8-[v1(48)]", views: mainImageView, profileImageView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(1)]|", views: cellSeparator)
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: cellSeparator)
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|-16-[v0(48)]-8-[v1]-16-|", views: profileImageView, mainLabel)
        
        allConstraints.append(NSLayoutConstraint(item: mainLabel, attribute: .Top, relatedBy: .Equal, toItem: mainImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Top, relatedBy: .Equal, toItem: mainLabel, attribute: .Bottom, multiplier: 1, constant: 0))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Left, relatedBy: .Equal, toItem: mainLabel, attribute: .Left, multiplier: 1, constant: 0))
        allConstraints.append(NSLayoutConstraint(item: subLabel, attribute: .Right, relatedBy: .Equal, toItem: mainLabel, attribute: .Right, multiplier: 1, constant: 0))
        
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
