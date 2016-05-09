//
//  ViewController.swift
//  iReceipts
//
//  Created by George Saieed on 9/7/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import UIKit
var receiptView = "all"
class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func changeSegment(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            receiptView = "all"
        case 1:
            receiptView = "personal"
        case 2:
            receiptView = "business"
        default:
            break;
        }
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

