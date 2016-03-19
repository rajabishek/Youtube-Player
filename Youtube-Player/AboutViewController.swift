//
//  AboutViewController.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonPressed() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func websiteButtonPressed(sender: UIButton) {
        // Use your own website URL here
        if let url = NSURL(string: "https://github.com/rajabishek") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}
