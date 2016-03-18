//
//  DataManager.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    
    func getVideosFromYoutube() -> [Video] {
        
        var videos = [Video]()
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        return videos
    }
}
