//
//  receiptTableCell.swift
//  iReceipts
//
//  Created by George Saieed on 4/16/16.
//  Copyright © 2016 George Saieed. All rights reserved.
//

import UIKit

protocol receiptTableCellDelegate : class {
    func receiptTableCellDidTouchDelete(cell: receiptTableCell, sender: AnyObject)
}
var theCellReceipt: AnyObject = false
class receiptTableCell: UITableViewCell {
    var delegate: receiptTableCellDelegate?
    
    @IBOutlet var backImage: UIImageView!
    @IBOutlet var receiptName: UILabel!
    @IBOutlet var purchaseMethod: UILabel!
    @IBOutlet var returnTime: UILabel!
    @IBOutlet var returnState: UILabel!
    @IBOutlet var totalCost: UILabel!
    @IBAction func deleteReceipt(sender: AnyObject) {
        delegate?.receiptTableCellDidTouchDelete(self, sender: sender)
    }
    @IBOutlet var returnSwitch: UISwitch!
    
    func configureWithReceipt(receipt: AnyObject) {
        let image = UIImage(named: ((receipt["receiptBackground"]as? String)!+"receipt.png"))
        let name = receipt["receiptName"] as? String
        let purchaseMethods = receipt["purchaseMethod"] as? String
        let cardTypes = receipt["cardType"] as? String
        let returnTimes = receipt["returnTime"] as? String
        let returnStates = receipt["keeping"] as? String
        let totalCosts = (receipt["receiptCost"] as? String)!
        let onOrNah = receipt["noKeepSwitch"] as? Bool
        print(String(onOrNah))
        
        var returnDistanceString = ""
        if returnTimes != "" {
            var dateFormatter:NSDateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            var todaysDate:NSDate = NSDate()
            var boughtOn = todaysDate
            var needToReturnBy = dateFormatter.dateFromString(receipt["returnBy"] as! String)
            var returnDistanceSec = needToReturnBy!.timeIntervalSinceDate(todaysDate)
            var returnDistanceDays = returnDistanceSec/(86400.0)
            var returnDistanceDaysInt = Int(returnDistanceDays+2)
            returnDistanceString = String(returnDistanceDaysInt)
        }
        
        backImage.image = image
        receiptName.text = name
        if (purchaseMethods == "Card") {
            purchaseMethod.text = cardTypes
        }
        else if (purchaseMethods == "Cash") {
            purchaseMethod.text = purchaseMethods
        }
        if returnDistanceString != "" && Int(returnDistanceString) != 0 && Int(returnDistanceString) > 0 {
            returnTime.text = returnDistanceString + " day(s) remaining"
        }
        else {
            returnTime.text = "Not returnable"
        }
        if returnTime.text == "Not returnable" {
            returnSwitch.setOn(false, animated:false)
            returnSwitch.enabled = false
        }
        if onOrNah == true {
            returnSwitch.setOn(true, animated:false)
            returnSwitch.enabled = false
        }
        totalCost.text = "$" + String(format:"%.2f", Float(totalCosts)!)
    }
    
    
}
