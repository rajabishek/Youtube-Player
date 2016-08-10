//
//  Constants.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 10/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class Color {
    
    static var wildSand = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
    
    static var battleShipGray = UIColor(red:0.51, green:0.51, blue:0.51, alpha:1.00)
    
    static var cardinalRed = UIColor(red:0.78, green:0.11, blue:0.25, alpha:1.00)
}

class Constraint {
    
    static func getConstraintsWithVisualFormat(format: String, views: UIView...) -> [NSLayoutConstraint] {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerate() {
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary["v\(index)"] = view
        }
        
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary)
    }

}
