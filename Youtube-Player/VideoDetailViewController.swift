//
//  VideoDetailViewController.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var video: Video!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = self.view.frame.size.width
        let height = (width / 640) * 300
        webViewHeightConstraint.constant = height
        let content = "<iframe width=\"\(width)\" height=\"\(height)\" src=\"http://www.youtube.com/embed/\(video.id)\" frameborder=\"0\" allowfullscreen></iframe>"
        webView.loadHTMLString(content, baseURL: nil)
        titleTextLabel.text = video.title
        descriptionTextLabel.text = video.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
