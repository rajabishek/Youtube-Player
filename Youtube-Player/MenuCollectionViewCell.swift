//
//  MenuCollectionViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: CustomCollectionViewCell {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var highlighted: Bool {
        didSet {
            iconImageView.tintColor = highlighted ? UIColor.whiteColor() : UIColor.blackColor()
        }
    }
    
    override var selected: Bool {
        didSet {
            iconImageView.tintColor = selected ? UIColor.whiteColor() : UIColor.blackColor()
        }
    }
    
    func populateImage(named: String) {
        iconImageView.image = UIImage(named: named)?.imageWithRenderingMode(.AlwaysTemplate)
        iconImageView.tintColor = UIColor.blackColor()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        backgroundColor = Color.cardinalRed
        
        addSubview(iconImageView)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:[v0(18)]", views: iconImageView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(18)]", views: iconImageView)
        
        allConstraints.append(NSLayoutConstraint(item: iconImageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        
        allConstraints.append(NSLayoutConstraint(item: iconImageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
