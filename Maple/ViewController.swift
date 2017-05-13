//
//  ViewController.swift
//  Maple
//
//  Created by Nikhil on 2/12/17.
//  Copyright © 2017 Nikhil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Instance for MenuManager Class
    let menuManager = MenuManager()
    
    //Menu Button invokes .openMenu function in MenuManager
    @IBAction func menuPressed(_ sender: Any) {
    
        menuManager.openMenu()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

