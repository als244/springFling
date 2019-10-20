//
//  LineupViewController.swift
//  Yale Spring Fling
//
//  Created by Alexis Dornan on 10/12/19.
//

import UIKit

class LineupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var lineupItems: [LineupSlot] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lineup"
        lineupItems = createLineup()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func createLineup() -> [LineupSlot]{
        
        let kanye = Artist(firstName: "Kanye", lastName: "West", picture: UIImage(named: "kanye"), bio: "He's Crazy", spotifyLink: "https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x")
        
        let elvis = Artist(firstName: "Elvis", lastName: "Presley", picture: UIImage(named: "elvis"), bio: "The King.", spotifyLink: "https://open.spotify.com/artist/43ZHCT0cAZBISjO8DG9PnE")
        
        let mj = Artist(firstName: "Michael", lastName: "Jackson", picture: UIImage(named: "michaelJackson"), bio: "Hope there aren't little ones out there", spotifyLink: "https://open.spotify.com/artist/3fMbdgg4jU18AjLCKBhRSm")
        
        let shein = Artist(firstName: "Andrew", lastName: "Sheinberg", picture: UIImage(named: "meSpringFling"), bio: "The Man. The Myth. The Legend.", spotifyLink: nil)
        
        let charlie = Artist(firstName: "Charlie", lastName: "Adams", picture: UIImage(named: "charlieAdams"), bio: "Aight folks, yoga time.", spotifyLink: nil)
        
        let slot1 = LineupSlot(artist: charlie, startTime: "1:30", endTime: "3:30")
        let slot2 = LineupSlot(artist: elvis, startTime: "4:00", endTime: "6:00")
        
        let slot3 = LineupSlot(artist: mj, startTime: "6:30", endTime: "8:30")
        
        let slot4 = LineupSlot(artist: kanye, startTime: "9:00", endTime: "11:00")
        
        let slot5 = LineupSlot(artist: shein, startTime: "11:30", endTime: "1:30")
        
        return [slot1, slot2, slot3, slot4, slot5]
    
    
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailsViewController else {return}
        let lineupSlot = lineupItems[tableView.indexPathForSelectedRow!.row]
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        detailVC.lineupSlot = lineupSlot
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.lineupItems)
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
