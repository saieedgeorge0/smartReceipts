//
//  chooseTrip.swift
//  iReceipts
//
//  Created by George Saieed on 9/12/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit

class chooseTrip: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var saved: UILabel!
    @IBOutlet var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = tripListItems
        individualReceipt["nameOfTrip"] = pickerData[0]
    }
    
    override func viewDidAppear(animated: Bool) {
       updateLabels = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        individualReceipt["nameOfTrip"] = pickerData[row]
        saved.text = "Saved!"
    }
    
}