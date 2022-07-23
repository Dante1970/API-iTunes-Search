//
//  TrackTableViewCell.swift
//  API iTunes Search
//
//  Created by Сергей Белоусов on 19.07.2022.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    @IBOutlet weak var imageTrack: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // some code
    }

}
