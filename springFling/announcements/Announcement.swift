//
//  Announcement.swift
//  YaleSpringFling
//
//  Created by Andrew Sheinberg on 10/15/19.
//

import Foundation
import UIKit

class Announcement{
    
    var message: String
    var datetime: Date
    var author: String?
    var picture: UIImage?
    
    
    init(message: String, datetime: Date, author: String?, picture: UIImage?) {
        self.message = message
        self.datetime = datetime
        self.author = author
        self.picture = picture
    }
    
}
