//
//  MerchCell.swift
//  springFling
//
//  Created by Alexis Dornan on 11/27/19.
//  Copyright © 2019 Andrew Sheinberg. All rights reserved.
//

import UIKit

class MerchCell: UITableViewCell {
    
    @IBOutlet weak var clothingPic: UIImageView!
    @IBOutlet weak var clothingNameLabel: UILabel!
    
    func setMerchSlot(slot : MerchSlot){
        let clothing = slot.clothing
        if let pic = clothing.picture{
            clothingPic.image = pic
        }
        clothingNameLabel.text = clothing.itemName
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
