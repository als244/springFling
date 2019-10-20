//
//  AnnouncementsViewController.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 10/15/19.
//

import UIKit
import Foundation

class AnnouncementsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var announcements : [Announcement] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        announcements = createAnnouncements()
        print(announcements)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // REPLACED BY DATABASE CALL, will want to fetch a sorted array by date
    func createAnnouncements() -> [Announcement] {
       
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "M/d/yyyy h:mm a"
        
        return [Announcement(message: "We got KANYE!!!", datetime: dateFormatter.date(from: "4/22/2019 12:00 pm")!, author: nil, picture: nil ), Announcement(message: "Lil Uzi Vert has cancelled :( ", datetime: dateFormatter.date(from: "4/20/2019 4:20 pm")!, author: nil, picture: nil), Announcement(message: "Happy Birthday, Andrew Sheinberg", datetime: dateFormatter.date(from: "3/9/2019 12:00 am")!, author: nil, picture: nil), Announcement(message: "Come to toads to see the lineup be revealed!!!", datetime: dateFormatter.date(from: "2/12/2019 7:30 pm")!, author: nil, picture: nil)]
  
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.announcements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("loadingCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementCell", for: indexPath) as! AnnouncementCell
        
        cell.setAnnouncment(announcement: announcements[indexPath.row])
        return cell
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
