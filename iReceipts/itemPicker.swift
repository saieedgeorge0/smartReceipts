//
//  itePicker.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit
var receiptItemsList = [String]()
var receiptPriceItemsList = [Float]()
class itemPicker: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var saved: UILabel!
    @IBOutlet var itemName: UITextField!
    @IBOutlet var itemPrice: UITextField!
    @IBAction func saveItem(sender: AnyObject) {
        var anItem = itemName.text!
        var anItemPriceText = itemPrice.text!
        if let mFloat = Float(anItemPriceText) {
            var anItemPrice = Float(anItemPriceText)
            receiptItemsList.append(anItem)
            receiptPriceItemsList.append(anItemPrice!)
            saved.text = "Saved!"
            aGlobalReceipt["items"] = [
                "name": anItem,
                "price": anItemPriceText
            ] as AnyObject?
            itemName.text = ""
            itemPrice.text = ""
        }
        else {
            saved.text = "Please enter a valid price."
        }
        receiptItems.reloadData()
    }
    
    @IBOutlet var receiptItems: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.receiptItems.delegate = self
        self.receiptItems.dataSource = self
        receiptItems.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        receiptItems.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptItemsList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! UITableViewCell
        item.textLabel?.text = receiptItemsList[indexPath.row] + " - $" + String(format:"%.2f",receiptPriceItemsList[indexPath.row])
        return item
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            receiptItemsList.removeAtIndex(indexPath.row)
            receiptItems.reloadData()
        }
    }
}