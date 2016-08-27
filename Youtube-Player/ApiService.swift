//
//  ApiService.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 27/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import Alamofire

class ApiService {
    
    static let sharedInstance = ApiService()
    
    func fetchVideos(completionHandler: ([Video]) -> ()) {
        
        var videos = [Video]()
        
        Alamofire.request(.GET, "https://api.myjson.com/bins/12qvh")
            .responseJSON { response in
                
                if let JSON = response.result.value as? [[String: AnyObject]] {
                    
                    for video in JSON {
                        if let channel = video["channel"] as? [String: AnyObject] {
                            
                            let channel = Channel(name: (channel["name"] as! String).capitalizedString, profileImageName: channel["profile_image_name"] as! String)
                            
                            videos.append(Video(thumbnailImageName: video["thumbnail_image_name"] as! String, title: video["title"] as! String, numberOfViews: video["number_of_views"] as! NSNumber, uploadDate: NSDate(), channel: channel))
                        } else {
                            print("Could not parse the JSON file")
                        }
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(videos)
                    })
                }
        }
        
    }
    
}
