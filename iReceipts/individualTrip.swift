//
//  individualTrip.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit

class individualTrip: UIViewController {
    
    @IBOutlet var saved: UILabel!
    @IBOutlet var tripName: UITextField!
    @IBAction func renameTrip(sender: AnyObject) {
        var newTripName = tripName.text!
        tripListItems[tempTripID] = newTripName
        saved.text = "Saved!"
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