//
//  ViewController.swift
//  fancyloader
//
//  Created by sagaya on 10/11/2018.
//  Copyright (c) 2018 sagaya. All rights reserved.
//

import UIKit

import fancyloader

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func spinnerAction(_ sender: Any) {
        Loader.shared.showLoader("landing_logo", UIColor(red:0.11, green:0.21, blue:0.34, alpha:0.7))

    }
    
}

