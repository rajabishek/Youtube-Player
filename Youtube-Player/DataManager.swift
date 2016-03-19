//
//  DataManager.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias JSONArray = [AnyObject]

protocol DataManagerDelegate {
    func didFinishLoadingVideosFromYoutube(videos: [Video])
}

extension String {
    func capitaliseFirstLetter() -> String {
        let lowercaseString = self.lowercaseString
        
        return lowercaseString.stringByReplacingCharactersInRange(lowercaseString.startIndex...lowercaseString.startIndex, withString: String(lowercaseString[lowercaseString.startIndex]).uppercaseString)
    }
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
        
        let playlistIdentifier = "PLC8F6495E49C4DC24"
        let secretKey = "AIzaSyDVBHhoMngCH4izHQGtzimN1hk_47qIHEs"
        let endpoint = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistIdentifier)&maxResults=50&key=\(secretKey)"
        
        Alamofire.request(.GET, endpoint).responseJSON { response in
            switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        for (_, item):(String, JSON) in json["items"] {
                            if let identifier = item["snippet"]["channelId"].string, let title = item["snippet"]["title"].string, let description = item["snippet"]["description"].string, let thumbnailUrl = item["snippet"]["thumbnails"]["high"]["url"].string {
                                videos.append(Video(title: title.capitaliseFirstLetter(), description: description.capitaliseFirstLetter(), thumbnailUrl: thumbnailUrl, id: identifier))
                            } else {
                                print("Could not parse the JSON data from youtube.")
                            }
                        }
                        if self.delegate != nil {
                            print(videos.count)
                            self.delegate?.didFinishLoadingVideosFromYoutube(videos)
                        }
                    }
                case .Failure(let error):
                    print(error)
            }
        }
    }
}
