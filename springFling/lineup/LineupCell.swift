//
//  LineupCell.swift
//  Yale Spring Fling
//
//  Created by Alexis Dornan on 10/10/19.
//

import UIKit

class LineupCell: UITableViewCell {
    
    @IBOutlet weak var artistPic: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setLineupSlot(slot : LineupSlot){
        let artist = slot.artist
        if let pic = artist.picture{
            artistPic.image = pic
        }
        nameLabel.text = artist.firstName + " " + artist.lastName
        
        timeLabel.text = slot.startTime + " - " + slot.endTime
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
