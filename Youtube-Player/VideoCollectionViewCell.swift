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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.redColor()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": mainImageView])
        
        allConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-16-[v0]-8-[v1(48)]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": mainImageView, "v1": profileImageView])
        
        allConstraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-16-[v0(48)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView])
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
