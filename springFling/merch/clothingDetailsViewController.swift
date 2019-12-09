//
//  clothingDetailsViewController.swift
//  springFling
//
//  Created by Alexis Dornan on 11/27/19.
//  Copyright © 2019 Andrew Sheinberg. All rights reserved.
//

import UIKit

class clothingDetailsViewController: UIViewController {
    
    var merchSlot : MerchSlot!
//    @IBOutlet weak var stayTunedLabel: UILabel!

    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var colorsLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var sizesLabel: UILabel!
    
    @IBOutlet weak var clothingPic: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var buyNowButton: UIButton!
    
    var buyNowLink : String!
    
    @objc func goToWebsite(){
        if let url = URL(string:buyNowLink) {
            UIApplication.shared.open(url)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = merchSlot.clothing.itemName
        // Do any additional setup after loading the view.
        if let pic = merchSlot.clothing.picture{
            clothingPic.image = pic
        }
        if let website = merchSlot.clothing.buyNowLink{
            buyNowLink = website
            buyNowButton!.addTarget(self, action: #selector(goToWebsite), for: .touchUpInside)
//            stayTunedLabel.isHidden = true
        }
        else{
            buyNowButton.isHidden = true
//            checkOutLabel.isHidden = true
//            stayTunedLabel.isHidden = false
        }
        // bio is an optional so possible error here
        descriptionLabel.text = merchSlot.clothing.description
        priceLabel.text = merchSlot.clothing.price
        colorsLabel.text = merchSlot.clothing.colors
        sizesLabel.text = merchSlot.clothing.sizes
    }
}
