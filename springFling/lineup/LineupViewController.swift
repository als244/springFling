//
//  LineupViewController.swift
//  Yale Spring Fling
//
//  Created by Alexis Dornan on 10/12/19.
//

import UIKit
import Firebase
import FirebaseStorage

class LineupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var lineupItems = [LineupSlot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lineup"
        lineupItems = createLineup()
        
        //populateLineup()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func populateLineup() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        

        ref.child("lineup").child("slots").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get all questions and answers
            var lineupItems : [LineupSlot] = []
            
            
            let value = snapshot.value as? NSDictionary
            for (_, slot) in value! {
                
                var artist = Artist(firstName: "", lastName: "", picture: nil, bio:  nil, spotifyLink: nil)
                let lineup_slot = slot as? NSDictionary
                
                let startTime = lineup_slot?["start_time"] as! String
                let endTime = lineup_slot?["end_time"] as! String
                let artistRef = lineup_slot?["artist"] as! String
                
                
                var bio : String?
                var first_name : String!
                var last_name : String!
                var spotify_link : String?
                var image : UIImage?
                
                
                ref.child("lineup").child("artists").child(artistRef).observeSingleEvent(of: .value, with: { (snapshot) in
                  // Get user value
                  let value = snapshot.value as? NSDictionary
                  bio = value?["bio"] as? String
                  first_name = value?["first_name"] as? String
                  last_name = value?["last_name"] as? String
                    spotify_link = value?["spotify_link"] as? String
                  
                  
                   if let image_ref = value?["picture"] as? String{
                    
                        print(image_ref)
                        let storageRef = Storage.storage()
                                           
                        let storage = storageRef.reference(forURL: "gs://spring-fling-39c0c.appspot.com")
                    
                        // Create a reference to the file you want to download
                        let storageImageRef = storage.child(image_ref)
                    
                        
                        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                          storageImageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                            if let error = error {
                              image = nil
                              print(error)
                              print("no image found")
                            } else {
                              // Data for image is returned
                             
                              print("found image")
                              image = UIImage(data: data!)
                            }
                          }


                    }
                    
                   
                })
                
                
                artist = Artist(firstName: first_name, lastName: last_name, picture: image, bio : bio, spotifyLink: spotify_link)
                let lineupItem = LineupSlot(artist: artist, startTime: startTime, endTime: endTime)
                print(lineupItem.artist.firstName)
                lineupItems.append(lineupItem)
            }
            
            print(lineupItems)
            self.lineupItems = lineupItems
            self.tableView.reloadData()

        })
        
        
    }
   
    func createLineup() -> [LineupSlot]{
      
    
        
        let kanye = Artist(firstName: "Kanye", lastName: "West", picture: UIImage(named: "kanye"), bio: "He's Crazy", spotifyLink: "https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x")
        
        let elvis = Artist(firstName: "Elvis", lastName: "Presley", picture: UIImage(named: "elvis"), bio: "The King.", spotifyLink: "https://open.spotify.com/artist/43ZHCT0cAZBISjO8DG9PnE")
 
        
        
        let slot1 = LineupSlot(artist: elvis, startTime: "6:00", endTime: "8:00")
    
        let slot2 = LineupSlot(artist: kanye, startTime: "8:30", endTime: "10:30")
        
        
        return [slot1, slot2]
    
    
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailsViewController else {return}
        let lineupSlot = lineupItems[tableView.indexPathForSelectedRow!.row]
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        detailVC.lineupSlot = lineupSlot
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lineupItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LineupCell", for: indexPath) as! LineupCell
        
        cell.setLineupSlot(slot : self.lineupItems[indexPath.row])
        
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
