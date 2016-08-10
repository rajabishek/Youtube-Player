//
//  HomeController.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController {
    
    let menuNavigationBar: MenuNavigationBar = {
        let menu  = MenuNavigationBar()
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(VideoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        customizeNavigationBar()
        
        setupMenuBar()
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        menuNavigationBar.collectionView.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .None)
    }
    
    func customizeNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = Color.cardinalRed
        navigationController?.navigationBar.translucent = false
        
        let mainTitle = NSMutableAttributedString(string:"Home", attributes:[NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size:16) ?? UIFont.systemFontOfSize(16), NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let subTitle = NSAttributedString(string:"\nrajabishek@hotmail.com", attributes:[NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size:12) ?? UIFont.systemFontOfSize(12), NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        mainTitle.appendAttributedString(subTitle)
        
        let mainLabel = UILabel(frame: CGRectMake(0, 0, 440, 44))
        mainLabel.attributedText = mainTitle
        mainLabel.numberOfLines = 0
        mainLabel.backgroundColor = UIColor.clearColor()
        mainLabel.textAlignment = .Center
        mainLabel.sizeToFit()
        
        navigationItem.titleView = mainLabel
        navigationController?.navigationBar.barStyle = .Black
        
        //Removes the shadow under the navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }
    
    private func setupMenuBar() {
        
        view.addSubview(menuNavigationBar)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: menuNavigationBar)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:|[v0(50)]", views: menuNavigationBar)
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let mainImageLength = self.view.frame.width - 32
        let mainImageHeight = (mainImageLength * 9) / 16
        let totalHeight = 16 + mainImageHeight + 8 + 20 + 40 + 8 + 1
        return CGSize(width: self.view.frame.width, height: totalHeight)
    }
}
