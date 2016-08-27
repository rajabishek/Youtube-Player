//
//  FeedCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 27/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class FeedCell: CustomCollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var videos = [Video]()
    
    let cellIdentifier = "Cell"
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerClass(VideoCollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        
        return collectionView
    }()
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(collectionView)
        
        var allConstraints = [NSLayoutConstraint]()
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: collectionView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|[v0]|", views: collectionView)
        NSLayoutConstraint.activateConstraints(allConstraints)
        
        fetchVideos()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! VideoCollectionViewCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 260)
    }
}
