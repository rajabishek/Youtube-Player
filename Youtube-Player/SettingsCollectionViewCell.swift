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
        label.font = UIFont(name: "AvenirNext-Demibold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(mainLabel)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: mainLabel)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|[v0]|", views: mainLabel)
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
