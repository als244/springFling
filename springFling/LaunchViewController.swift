//
//  LaunchViewController.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 9/9/19.
<<<<<<< HEAD
=======
//  Copyright © 2019 Project T. All rights reserved.
>>>>>>> 2c2490b83bcddd4a965b64bc84eb04b93f2a9301
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleepAndTransition()
    }
    
    func sleepAndTransition() {
        Thread.sleep(forTimeInterval: 3.0)
        performSegue(withIdentifier: "LaunchSegue", sender: self)
    }


}

