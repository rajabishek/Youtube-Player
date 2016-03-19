//
//  VideosTableViewController.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class VideosTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataManagerDelegate {

    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = nil
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        let manager = DataManager()
        manager.delegate = self
        
        manager.getVideosFromYoutube()
    }
    
    func didFinishLoadingVideosFromYoutube(videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! VideoTableViewCell
        
        // alternate background color
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clearColor()
        } else {
            cell.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        }
        
        cell.populateCellWithDataFromVideo(videos[indexPath.row])
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailedView" {
            if let destinationViewController = segue.destinationViewController as? VideoDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destinationViewController.video = videos[indexPath.row]
                }
            }
        }
    }
}
