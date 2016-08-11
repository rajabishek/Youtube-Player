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
        label.text = "Luke Cage | Official Trailer [HD] | Netflix"
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()g
    
    override func setupLayout() {
        super.setupLayout()
        
        backgroundColor = Color.cardinalRed
    }
}
