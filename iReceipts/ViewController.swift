//
//  ViewController.swift
//  iReceipts
//
//  Created by George Saieed on 9/7/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttonBlah: UIButton!
    
    @IBAction func ifClicked(sender: AnyObject) {
        buttonBlah.setTitle("ANAND", forState: .Normal)
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

