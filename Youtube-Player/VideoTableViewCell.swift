//
//  VideoTableViewCell.swift
//  Youtube-Player
//
//  Created by Raj Abishek on 19/03/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var videoImageView: UIImageView!
    
    var video: Video!
    
    func populateCellWithDataFromVideo(video: Video) {
        
        titleTextLabel.text = video.title
        DataManager().getImageFromUrl(video.thumbnailUrl) { data in self.videoImageView.image = UIImage(data: data) }
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
