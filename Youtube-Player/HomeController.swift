//
//  HomeController.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import Fakery

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController {
    
    var videos = [Video]()
        
    let menuNavigationBar: MenuNavigationBar = {
        let menu  = MenuNavigationBar()
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            self.videos = videos
            self.collectionView?.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchVideos()
    }

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
    
    func getTitleViewForNavigationBar(title: String, fontSize: CGFloat = 17) -> UILabel {
        
        let label = UILabel(frame: CGRectZero)
        
        label.text = title
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Center
        label.font = UIFont(name: "FiraSans-Medium", size:fontSize) ?? UIFont.systemFontOfSize(fontSize)
        label.textColor = UIColor.whiteColor()
        label.sizeToFit()

        return label
    }
    
    func customizeNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = Color.cardinalRed
        navigationController?.navigationBar.translucent = false
        
        //Sets the navigation bar title
        navigationItem.titleView = getTitleViewForNavigationBar("Home")
        navigationController?.navigationBar.barStyle = .Black
        
        //Removes the shadow under the navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        //Setup the navigation bar button items
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search-icon")?.imageWithRenderingMode(.AlwaysTemplate), style: .Plain, target: self, action: #selector(handleSearch))
        searchBarButtonItem.tintColor = UIColor.whiteColor()
        
        let moreBarButtonItem = UIBarButtonItem(image: UIImage(named: "more-icon")?.imageWithRenderingMode(.AlwaysTemplate), style: .Plain, target: self, action: #selector(handleMore))
        moreBarButtonItem.tintColor = UIColor.whiteColor()
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
    }
    
    func handleSearch() {
        
        
    }
    
    lazy var settingLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.delegate = self
        return launcher
    }()
    
    func handleMore() {
        settingLauncher.showSettings()
    }
    
    func handleDismiss() {
        settingLauncher.dismissSettings()
    }
    
    func presentViewControllerForSetting(setting: Setting) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.whiteColor()

        viewController.navigationItem.titleView = getTitleViewForNavigationBar(setting.name.rawValue)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupMenuBar() {
        
        navigationController?.hidesBarsOnSwipe = true
        
        let grayView = UIView()
        grayView.backgroundColor = Color.wildSand
        grayView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(grayView)
        view.addSubview(menuNavigationBar)
        
        var allConstraints = [NSLayoutConstraint]()
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: grayView)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(50)]", views: grayView)
        
        allConstraints += Constraint.getConstraintsWithVisualFormat("H:|[v0]|", views: menuNavigationBar)
        allConstraints += Constraint.getConstraintsWithVisualFormat("V:[v0(50)]", views: menuNavigationBar)
        
        menuNavigationBar.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        
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
        return videos.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! VideoCollectionViewCell
        cell.video = videos[indexPath.row]
        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 260)
    }
}
