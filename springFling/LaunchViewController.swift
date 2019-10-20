//
//  LaunchViewController.swift
//  Yale Spring Fling
//
//  Created by Andrew Sheinberg on 9/9/19.
//  Copyright © 2019 Project T. All rights reserved.
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

