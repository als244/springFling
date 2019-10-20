//
//  lineupItem.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 7/10/19.
//  Copyright © 2019 Project T. All rights reserved.
//


class LineupSlot{
    
    var artist: Artist
    
    // maybe make time a date..?
    var startTime: String
    var endTime: String
    
    init(artist: Artist, startTime: String, endTime:String){
        self.artist = artist
        self.startTime = startTime
        self.endTime = endTime
    }

}
