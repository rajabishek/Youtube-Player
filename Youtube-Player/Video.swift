//
//  Video.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import Foundation

class Video {
    
    var title: String
    
    var description: String
    
    var thumbnailUrl: String
    
    var id: String
    
    init(title: String, description: String, thumbnailUrl:String, id: String) {
        self.title = title
        self.description = description
        self.thumbnailUrl = thumbnailUrl
        self.id = id
    }
}
