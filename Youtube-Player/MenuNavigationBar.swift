//
//  MenuNavigationBar.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class MenuNavigationBar: UIView {
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Color.cardinalRed
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        backgroundColor = Color.cardinalRed
        addSubview(collectionView)
        
        var allConstraints = [NSLayoutConstraint]()
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: collectionView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|[v0]|", views: collectionView)
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
}
