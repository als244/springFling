//
//  Artist.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 7/10/19.
//  Copyright © 2019 Project T. All rights reserved.
//

import UIKit

class Artist{
    
    var firstName : String
    var lastName : String
    var picture : UIImage?
    
    var bio : String?
    
    var spotifyLink : String?
    
    init(firstName: String, lastName: String, picture: UIImage?, bio : String?, spotifyLink: String?){
        self.firstName = firstName
        self.lastName = lastName
        self.picture = picture
        self.bio = bio
        self.spotifyLink = spotifyLink
    }
}
