//
//  MenuNavigationBar.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class MenuNavigationBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = "cellId"
    
    let iconNames = ["home-icon", "play-icon", "camera-icon", "bell-icon"]
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    var delegate: HomeController!
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Color.cardinalRed
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let horizontalBar: UIView = {
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = Color.cardinalRed
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        return horizontalBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
        setupHorizontalBar()
    }
    
    func setupHorizontalBar() {
        
        addSubview(horizontalBar)
        
        horizontalBarLeftAnchorConstraint = horizontalBar.leftAnchor.constraintEqualToAnchor(self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.active = true
        horizontalBar.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        horizontalBar.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 1/4).active = true
        horizontalBar.heightAnchor.constraintEqualToConstant(3).active = true
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        horizontalBarLeftAnchorConstraint?.constant = CGFloat(indexPath.item) * (frame.width/4)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        delegate.scrollToMenuIndex(indexPath.item)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        collectionView.registerClass(MenuCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        backgroundColor = Color.cardinalRed
        addSubview(collectionView)
        
        var allConstraints = [NSLayoutConstraint]()
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: collectionView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|[v0]|", views: collectionView)
        NSLayoutConstraint.activateConstraints(allConstraints)
        
        let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        collectionView.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .None)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! MenuCollectionViewCell
        cell.populateImage(iconNames[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
