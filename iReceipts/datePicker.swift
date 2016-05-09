//
//  datePicker.swift
//  iReceipts
//
//  Created by George Saieed on 9/11/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit

class datePicker: UIViewController {
    
    
    @IBOutlet var saved: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        var todaysDate:NSDate = NSDate()
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        individualReceipt["purchaseDate"] = dateFormatter.stringFromDate(todaysDate)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        updateLabels = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        individualReceipt["purchaseDate"] = dateFormatter.stringFromDate(datePicker.date)
        saved.text = "Saved!"
    }
    
}