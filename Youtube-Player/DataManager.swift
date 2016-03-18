//
//  DataManager.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import Foundation
import Alamofire

typealias JSONArray = [AnyObject]

protocol DataManagerDelegate {
    func didFinishLoadingVideosFromYoutube(videos: [Video])
}

class DataManager {
    
    var delegate: DataManagerDelegate?
    
    func getImageFromUrl(url: String, completion: (data: NSData) -> ()) {
        Alamofire.request(.GET, url).response { (request, response, data, error) -> Void in
            if data != nil {
                completion(data: data!)
            }
        }
    }
    
    func getVideosFromYoutube() {
        
        var videos = [Video]()
        
        let endpoint = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=PLOU2XLYxmsIIM9h1Ybw2DuRw6o2fkNMeR%2CPLyYlLs02rgBYRWBzYpoHz7m2SE8mEZ68w&key=AIzaSyDVBHhoMngCH4izHQGtzimN1hk_47qIHEs"
        
        Alamofire.request(.GET, endpoint, parameters: ["foo": "bar"])
            .responseJSON { response in
                if let JSON = response.result.value {
                    if let items = JSON["items"] as? JSONArray {
                        for item in items {
                            if let identifier = item.valueForKeyPath("snippet.channelId") as? String, let title = item.valueForKeyPath("snippet.title") as? String, let description = item.valueForKeyPath("snippet.description") as? String, let thumbnailUrl = item.valueForKeyPath("snippet.thumbnails.maxres.url") as? String {
                                videos.append(Video(title: title, description: description, thumbnailUrl: thumbnailUrl, id: identifier))
                            } else {
                                print("Could not parse the JSON data from youtube.")
                            }
                        }
                    } else {
                        print("Could not parse the JSON data from youtube.")
                    }
                }
                
                if self.delegate != nil {
                    print(videos.count)
                    self.delegate?.didFinishLoadingVideosFromYoutube(videos)
                }
        }
    }
}
