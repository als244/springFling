//
//  lineupItem.swift
//  Yale Spring Fling
//
//  Created by Alexis Dornan on 10/10/19.
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
