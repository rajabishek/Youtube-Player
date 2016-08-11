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
        
        if let url = NSURL(string: "http://localhost:8080/home.json") {
            
            let request = NSURLRequest(URL: url)
            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            
            let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
                
                if let responseError = error {
                    print("Error calling GET on /home.json")
                    print(responseError)
                }
                
                if let responseData = data {
                    do {
                        
                        if let videosData = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as? [[String: AnyObject]] {
                            
                            for video in videosData {
                                if let channel = video["channel"] as? [String: AnyObject] {
                                    
                                    let channel = Channel(name: (channel["name"] as! String).capitalizedString, profileImageName: channel["profile_image_name"] as! String)
                                    
                                    self.videos.append(Video(thumbnailImageName: video["thumbnail_image_name"] as! String, title: video["title"] as! String, numberOfViews: video["number_of_views"] as! NSNumber, uploadDate: NSDate(), channel: channel))
                                } else {
                                    print("Could not parse the JSON file")
                                }
                            }
                            
                            dispatch_async(dispatch_get_main_queue(), {
                                self.collectionView?.reloadData()
                            })
                            
                        } else {
                            print("Unable to convert the data to JSON")
                        }
                    } catch {
                        print("Unable to convert the data to JSON")
                    }
                } else {
                    print("There is no data from the endpoint")
                }

            })
            task.resume()
            
        } else {
            print("The url is not a valid one")
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
    
    func customizeNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = Color.cardinalRed
        navigationController?.navigationBar.translucent = false
        
        //Sets the naigation bar title
        let mainLabel = UILabel(frame: CGRectMake(0, 0, 440, 44))
        mainLabel.text = "Home"
        mainLabel.backgroundColor = UIColor.clearColor()
        mainLabel.textAlignment = .Center
        mainLabel.font = UIFont(name: "AvenirNext-Medium", size:17) ?? UIFont.systemFontOfSize(17)
        mainLabel.textColor = UIColor.whiteColor()
        mainLabel.sizeToFit()
        
        navigationItem.titleView = mainLabel
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
    
    let settingLauncher = SettingsLauncher()
    
    func handleMore() {
        settingLauncher.showSettings()
    }
    
    func handleDismiss() {
        settingLauncher.dismissSettings()
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
