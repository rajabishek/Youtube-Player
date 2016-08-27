//
//  SettingsCollectionViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 11/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class SettingsCollectionViewCell: CustomCollectionViewCell {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont(name: "FiraSans-Regular", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home-icon")?.imageWithRenderingMode(.AlwaysTemplate)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()
    
    var setting: Setting! {
        didSet {
            iconImageView.image = UIImage(named: setting.iconImageName)?.imageWithRenderingMode(.AlwaysTemplate)
            iconImageView.tintColor = Color.battleShipGray
            mainLabel.text = setting.name
        }
    }

    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = Color.battleShipGray
                mainLabel.textColor = UIColor.whiteColor()
                iconImageView.tintColor = UIColor.whiteColor()
            } else {
                backgroundColor = Color.wildSand
                mainLabel.textColor = UIColor.blackColor()
                iconImageView.tintColor = Color.battleShipGray
            }
        }
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(mainLabel)
        addSubview(iconImageView)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|-16-[v0(20)]-16-[v1]|", views: iconImageView, mainLabel)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|[v0]|", views: mainLabel)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(20)]", views: iconImageView)
        
        allConstraints.append(NSLayoutConstraint(item: iconImageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
