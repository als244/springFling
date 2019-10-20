//
//  ResourceImageViewController.swift
//  YaleSpringFling
//
//  Created by Andrew Sheinberg on 7/10/19.
//  Copyright © 2019 Project T. All rights reserved.
//

import UIKit

class ResourceImageViewController: UIViewController {

    @IBOutlet weak var imageTitle: UILabel!
    
    @IBOutlet weak var resourceImage: UIImageView!
    
    var resource : Resource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resourceImage.image = resource.picture
        imageTitle.text = resource.name
        // Do any additional setup after loading the view.
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
