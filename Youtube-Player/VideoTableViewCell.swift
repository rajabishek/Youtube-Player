//
//  VideoTableViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import Kingfisher

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var videoImageView: UIImageView!
    
    var video: Video!
    
    func populateCellWithDataFromVideo(video: Video) {
        
        titleTextLabel.text = video.title
        if let url = NSURL(string: video.thumbnailUrl) {
            videoImageView.kf_setImageWithURL(url)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
