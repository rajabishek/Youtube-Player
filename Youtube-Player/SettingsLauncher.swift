//
//  SettingsLauncher.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 11/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var delegate: HomeController!
    
    let dimmingView  = UIView()
    
    let cellIdentifier = "settingsCell"
    
    let collectionViewCellHeight = 40
    
    let settings: [Setting] = {
        
        return [
            Setting(name: "Bell", iconImageName: "bell-icon"),
            Setting(name: "Camera", iconImageName: "camera-icon"),
            Setting(name: "Home", iconImageName: "home-icon"),
            Setting(name: "Search", iconImageName: "search-icon"),
            Setting(name: "Play", iconImageName: "play-icon")
        ]
    }()
    
    override init() {
        
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerClass(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Color.wildSand
        return collectionView
    }()
    
    func showSettings() {
        
        if let window = UIApplication.sharedApplication().keyWindow {
            dimmingView.frame = window.frame
            dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            dimmingView.alpha = 0
            dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(dismissSettings)))
            
            window.addSubview(dimmingView)
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: CGFloat(collectionViewCellHeight * settings.count))
            window.addSubview(collectionView)
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
                self.dimmingView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height - CGFloat(self.collectionViewCellHeight * self.settings.count), width: window.frame.width, height: 200)
            }, completion: nil)
        }
    }
    
    @objc func dismissSettings() {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
                self.dimmingView.alpha = 0
                if let window = UIApplication.sharedApplication().keyWindow {
                    self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: CGFloat(self.collectionViewCellHeight * self.settings.count))
                }
            }, completion: nil)

    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! SettingsCollectionViewCell
        cell.setting = settings[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(collectionViewCellHeight))
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
                self.dimmingView.alpha = 0
                if let window = UIApplication.sharedApplication().keyWindow {
                    self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: CGFloat(self.collectionViewCellHeight * self.settings.count))
                }
            }, completion: { (completed: Bool) in
                let setting = self.settings[indexPath.item]
                if setting.name != "Play" {
                    self.delegate.presentViewControllerForSetting(setting)
                    return
                }
        })
    }
}
