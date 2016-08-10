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
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.redColor()
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
        
        allConstraints += getConstraintsWithVisualFormat("H:|-16-[v0]-16-|", views: mainImageView)
        allConstraints += getConstraintsWithVisualFormat("V:|-16-[v0]-8-[v1(48)]-16-|", views: mainImageView, profileImageView)
        allConstraints += getConstraintsWithVisualFormat("H:|-16-[v0(48)]", views: profileImageView)
        
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
