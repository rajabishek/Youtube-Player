//
//  Video.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 11/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class Video {
    
    let thumbnailImageName: String
    
    let title: String
    
    let numberOfViews: NSNumber
    
    let uploadDate: NSDate
    
    init(thumbnailImageName: String, title: String, numberOfViews: NSNumber, uploadDate: NSDate) {
        self.thumbnailImageName = thumbnailImageName
        self.title = title
        self.numberOfViews = numberOfViews
        self.uploadDate = uploadDate
    }
}
