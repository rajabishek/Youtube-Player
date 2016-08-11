//
//  SettingsLauncher.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 11/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class SettingsLauncher {
    
    let dimmingView  = UIView()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.whiteColor()
        return collectionView
    }()
    
    func showSettings() {
        
        if let window = UIApplication.sharedApplication().keyWindow {
            dimmingView.frame = window.frame
            dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            dimmingView.alpha = 0
            dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(dismissSettings)))
            
            window.addSubview(dimmingView)
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
            window.addSubview(collectionView)
            
            UIView.animateWithDuration(0.3, animations: {
                self.dimmingView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height - 200, width: window.frame.width, height: 200)
            })
        }
    }
    
    @objc func dismissSettings() {
        if let window = UIApplication.sharedApplication().keyWindow {
            UIView.animateWithDuration(0.3, animations: {
                self.dimmingView.alpha = 0
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
            })
        }
    }

    
    
}
