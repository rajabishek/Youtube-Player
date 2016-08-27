//
//  Setting.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 11/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

enum Settings: String {
    case Bell
    case Camera
    case Home
    case Search
    case Play
    case Cancel
}

class Setting {
    
    let name: Settings
    
    let iconImageName: String
    
    init(name: Settings, iconImageName: String) {
        
        self.name = name
        self.iconImageName = iconImageName
    }
}
