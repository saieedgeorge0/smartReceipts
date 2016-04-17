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

class receiptTableCell: UITableViewCell {
    var delegate: receiptTableCellDelegate?
    
    @IBOutlet var backImage: UIImageView!
    @IBOutlet var receiptName: UILabel!
    @IBOutlet var purchaseMethod: UILabel!
    @IBOutlet var returnTime: UILabel!
    @IBOutlet var returnState: UILabel!
    @IBOutlet var totalCost: UILabel!
    @IBOutlet var returnSwitch: UISwitch!
    @IBAction func deleteReceipt(sender: AnyObject) {
        delegate?.receiptTableCellDidTouchDelete(self, sender: sender)
    }
    
    func configureWithReceipt(receipt: AnyObject) {
        let image = UIImage(named: ((receipt["receiptBackground"]as? String)!+"receipt.png"))
        let name = receipt["receiptName"] as? String
        let purchaseMethods = receipt["purchaseMethod"] as? String
        let cardTypes = receipt["cardType"] as? String
        let returnTimes = receipt["returnTime"] as? String
        let returnStates = receipt["keeping"] as? String
        let totalCosts = "$" + (receipt["receiptCost"] as? String)!
        let onOrNah = receipt["noKeepSwitch"] as? Bool
        print(String(onOrNah))
        
        backImage.image = image
        receiptName.text = name
        if (purchaseMethods == "Card") {
            purchaseMethod.text = cardTypes
        }
        else if (purchaseMethods == "Cash") {
            purchaseMethod.text = purchaseMethods
        }
        returnTime.text = returnTimes! + " days remaining"
        returnState.text = returnStates
        totalCost.text = totalCosts
        returnSwitch.setOn(onOrNah!, animated: true)

    }
    
}
