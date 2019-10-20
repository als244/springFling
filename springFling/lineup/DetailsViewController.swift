//
//  DetailsViewController.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 7/10/19.
//  Copyright © 2019 Project T. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var lineupSlot : LineupSlot!
    @IBOutlet weak var stayTunedLabel: UILabel!
    
    @IBOutlet weak var checkOutLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var artistPic: UIImageView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var spotifyButton: UIButton!
    
    var spotifyLink : String!
    
    @objc func goToSpotify(){
        if let url = URL(string:spotifyLink) {
            UIApplication.shared.open(url)
        }
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = lineupSlot.artist.firstName + " " + lineupSlot.artist.lastName
        timeLabel.text = lineupSlot.startTime + " - " + lineupSlot.endTime
        // Do any additional setup after loading the view.
        if let pic = lineupSlot.artist.picture{
            artistPic.image = pic
        }
        if let spotify = lineupSlot.artist.spotifyLink{
            spotifyLink = spotify
            spotifyButton!.addTarget(self, action: #selector(goToSpotify), for: .touchUpInside)
            stayTunedLabel.isHidden = true
        }
        else{
            spotifyButton.isHidden = true
            checkOutLabel.isHidden = true
            stayTunedLabel.isHidden = false
        }
        // bio is an optional so possible error here
        bioLabel.text = lineupSlot.artist.bio
        
       
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
