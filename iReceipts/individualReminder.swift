//
//  individualCard.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit

class individualReminder: UIViewController {
    
    
    @IBOutlet var saved: UILabel!
    @IBOutlet var reminderName: UITextField!
    @IBAction func saveReminder(sender: AnyObject) {
        if let mInt = Int(reminderName.text!) {
            var aReminder = reminderName.text!
            listOfRemindersItems.append(aReminder)
            saved.text = "Saved!"
            reminderName.text = ""
        }
        else {
            saved.text = "Please enter a valid number of days."
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