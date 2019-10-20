//
//  ResourcesViewController.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 7/9/19.
//  Copyright © 2019 Project T. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
  
    private var resources: [Resource] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Resources"
        resources = createResources()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // deselect the selected row if any
        let selectedRow: IndexPath? = tableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            tableView.deselectRow(at: selectedRowNotNill, animated: true)
        }
    }

    // WILl BE REPLACED BY DATABASE CALL
    func createResources() -> [Resource] {
        return [Resource(name: "Call Yale Police", phoneNumber: "tel:2034324400", link: nil, picture:nil),
                Resource(name: "Call 911", phoneNumber: "tel:911", link: nil, picture:nil), Resource(name: "Spring Fling Website", phoneNumber: nil, link: "https://springfling.yale.edu/", picture: nil) , Resource(name: "Spring Fling Facebook", phoneNumber: nil, link: "https://www.facebook.com/yalespringfling/", picture:nil), Resource(name: "Map", phoneNumber: nil, link: nil, picture: UIImage(named: "oldCampusMap"))]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResourceCell
        
        cell.setResource(resource: resources[indexPath.row])
        print(cell)
        return cell
    }
    
    // THIS ISN"T GOOD CODE TO PREFORM ACTION AFTER CLICK
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if resources[index].picture != nil {
            print("saw image")
            let imageVC = self.storyboard?.instantiateViewController(withIdentifier: "ResourceImageViewController") as! ResourceImageViewController
            imageVC.resource = resources[index]
            self.navigationController?.pushViewController(imageVC, animated: true)
        }
        if let link = resources[index].link{
            print(link)
            if let url = URL(string:link) {
                UIApplication.shared.open(url)
            }
        }
        if let phoneNumber = resources[index].phoneNumber{
            if let numberUrl = URL(string: phoneNumber){
                print(numberUrl)
                UIApplication.shared.open(numberUrl)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
       
    
}
