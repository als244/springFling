//
//  merchViewController.swift
//  springFling
//
//  Created by Alexis Dornan on 9/7/19.
//  Copyright © 2019 Andrew Sheinberg. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class merchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var showroomItems = [MerchSlot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shop"
        showroomItems = createShowroom()
        
        //populateShowroom()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//    }
    
    func populateShowroom() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("merch").child("slots").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get all questions and answers
            var showroomItems : [MerchSlot] = []
            
            let value = snapshot.value as? NSDictionary
            for (_, slot) in value! {
                
                var clothing = Clothing(itemName: "", picture: nil, description:  nil, buyNowLink: "", price: "", colors: "", sizes: "")
                let merch_slot = slot as? NSDictionary
                
                //clothing as in from merchSlot
                let clothingRef = merch_slot?["clothing"] as! String
                
                var description : String?
                var item_name : String!
                var buyNow_link : String!
                var image : UIImage?
                var colors : String!
                var price : String!
                var sizes : String!
               
                //clothing as in
                // weird space indent
                // retrieve the post and listen for changes
            ref.child("merch").child("clothing").child(clothingRef).observeSingleEvent(of: .value, with: { (snapshot) in
                  // Get user value
                  let value = snapshot.value as? NSDictionary
                  description = value?["description"] as? String
                  item_name = value?["item_name"] as? String
                  buyNow_link = value?["buyNow_link"] as? String
                    colors = value?["colors"] as? String
                    price = value?["price"] as? String
                    sizes = value?["sizes"] as? String
                  
                  
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
                
                clothing = Clothing(itemName: item_name,picture: image, description : description, buyNowLink: buyNow_link, price: price, colors: colors, sizes: sizes)
                let showroomItem = MerchSlot(clothing: clothing)
                print(showroomItem.clothing.itemName)
                showroomItems.append(showroomItem)
            }
            
            print(showroomItems)
            self.showroomItems = showroomItems
            self.tableView.reloadData()

        })
        
    }
   
    func createShowroom() -> [MerchSlot]{
        
        let goldengoose = Clothing(itemName: "Superstar Sneakers", picture: UIImage(named: "shoe"), description: "These white-and-gold Golden Goose sneakers are a little bit more toned down than the brand's usual, but still have the cool, broken-in style that has made them one of our forever favorites.", buyNowLink: "https://www.shopbop.com/star-sneakers-golden-goose/vp/v=1/1540851516.htm?gclid=CjwKCAiA_f3uBRAmEiwAzPuaM7aTd_WinZB5UVI-nUJ5xE1GSIGyTuFTfQ36LfHmAszKJxKPDd0n8BoCbOEQAvD_BwE&currencyCode=USD&extid=SE_froogle_SC_usa&cvosrc=cse.google.GOOSE20619&cvo_campaign=SB_Google_USD&ef_id=CjwKCAiA_f3uBRAmEiwAzPuaM7aTd_WinZB5UVI-nUJ5xE1GSIGyTuFTfQ36LfHmAszKJxKPDd0n8BoCbOEQAvD_BwE:G:s", price: "$100", colors: "Colors: red, white, and orange", sizes: "Sizes: Women's 6, 7, 8, 9")
        
        let yale = Clothing(itemName: "Corduroy Yale Hat", picture: UIImage(named: "hat"), description: "Inspired by the fun and stylish fabrics of yesteryear, our corduroy ball cap is a true vintage throwback making a reappearance in a big way. The small wale cords are right on trend, available in our classics low profile, relaxed adjustable fit and available in four warm and stylish colors. Imported.", buyNowLink: "https://yale.bncollege.com/shop/ProductDisplay?topCatId=40000&level=&imageId=1846805&urlRequestType=Base&productId=400000470345&catalogId=10001&categoryId=40402&parentCatId=40017&graphicId=VE02434502&langId=-1&storeId=16556", price: "$27", colors: "Colors: black, blue, and white", sizes: "One Size")

        let slot1 = MerchSlot(clothing: goldengoose)
    
        let slot2 = MerchSlot(clothing: yale)
        
        return [slot1, slot2]
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let clothingDVC = segue.destination as? clothingDetailsViewController else {return}
        let merchSlot = showroomItems[tableView.indexPathForSelectedRow!.row]
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        clothingDVC.merchSlot = merchSlot
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.showroomItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MerchCell", for: indexPath) as! MerchCell
        
        cell.setMerchSlot(slot : self.showroomItems[indexPath.row])
        
        return cell
    }
}
