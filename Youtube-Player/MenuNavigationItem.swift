//
//  MenuNavigationItem.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 27/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class MenuNavigationItem {
    
    let title: String
    
    let iconName: String
    
    init(title: String, iconName: String? = nil) {
        self.title = title
        if let iconName = iconName {
            self.iconName = iconName
        } else {
            self.iconName = "\(title.lowercaseString)-icon"
        }
    }
}
