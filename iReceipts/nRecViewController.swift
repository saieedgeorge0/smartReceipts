//
//  nRecViewController.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit

//dictionary to temporarily store receipt
var individualReceipt =
["receiptType": "Personal",
    "itemName":"",
    "itemPrice": "",
    "itemPayment":"Cash",
    "cardType":"",
    "purchaseDate":"",
    "returnTime":"",
    "reminders":true,
    "purchasedAt":"",
    "address":"",
    "partOfTrip":false,
    "nameOfTrip":""]
var pickerType = ""
var updateLabels = false
var finalReceiptImage: UIImage = UIImage()

class nRecViewController: UIViewController {
    
    @IBOutlet var itemPurchased: UITextField!
    @IBOutlet var purchasePrice: UITextField!
    @IBOutlet var returnInDays: UITextField!
    @IBOutlet var purchasedAt: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var personalOut: UIButton!
    @IBOutlet var businessOut: UIButton!
    @IBAction func personalButton(sender: AnyObject) {
        let image = UIImage(named: "personalf.png")as UIImage!
        let image2 = UIImage(named: "businessuf.png")
        personalOut.setBackgroundImage(image, forState: UIControlState.Normal)
        businessOut.setBackgroundImage(image2, forState: UIControlState.Normal)
        individualReceipt["receiptType"] = "Personal"
        
    }
    @IBAction func businessButton(sender: AnyObject) {
        let image = UIImage(named: "personaluf.png")as UIImage!
        let image2 = UIImage(named: "businessf.png")
        personalOut.setBackgroundImage(image, forState: UIControlState.Normal)
        businessOut.setBackgroundImage(image2, forState: UIControlState.Normal)
        individualReceipt["receiptType"] = "Business"
    }
    
    @IBOutlet var cashOut: UIButton!
    @IBOutlet var cardOut: UIButton!
    @IBOutlet var cardTypeOut: UIButton!
    
    @IBAction func cashButton(sender: AnyObject) {
        let image = UIImage(named: "paymentf.png")as UIImage!
        let image2 = UIImage(named: "paymentuf.png")
        cashOut.setBackgroundImage(image, forState: UIControlState.Normal)
        cardOut.setBackgroundImage(image2, forState: UIControlState.Normal)
        cashOut.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        cardOut.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        individualReceipt["itemPayment"] = "Cash"
        individualReceipt["cardType"] = ""
        cardTypeOut.setTitle("", forState: UIControlState.Normal)
        cardTypeOut.enabled = false
    }
    @IBAction func cardButton(sender: AnyObject) {
        if listOfCardsItems.count != 0 {
            let image2 = UIImage(named: "paymentf.png")as UIImage!
            let image = UIImage(named: "paymentuf.png")
            cashOut.setBackgroundImage(image, forState: UIControlState.Normal)
            cardOut.setBackgroundImage(image2, forState: UIControlState.Normal)
            cardOut.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            cashOut.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            pickerType = "card"
            if listOfCardsItems.count == 1 {
                individualReceipt["cardType"] = listOfCardsItems[0]
                cardTypeOut.setTitle(individualReceipt["cardType"] as? String, forState: UIControlState.Normal)
            }
            if listOfCardsItems.count > 1 {
                self.performSegueWithIdentifier("chooseCardSegue", sender: self)
            }
            individualReceipt["itemPayment"] = "Card"
        }
        else {
            cardTypeOut.setTitle("Add a Card in Settings", forState: UIControlState.Normal)
            cardTypeOut.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        }
    }
    
    @IBOutlet var dateOut: UIButton!
    @IBOutlet var nameOfTripOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view, typically from a nib.
        var todaysDate:NSDate = NSDate()
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateOut.setTitle(dateFormatter.stringFromDate(todaysDate), forState: UIControlState.Normal)
        
        self.makeRoundImage()
    }
    
    private func makeRoundImage() {
        self.image.layer.cornerRadius = 15.0
        self.image.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        if updateLabels == true && individualReceipt["itemPayment"] == "Card" {
            cardTypeOut.setTitle(individualReceipt["cardType"] as? String, forState: UIControlState.Normal)
        }
        if updateLabels == true && individualReceipt["partOfTrip"] == true {
            nameOfTripOut.setTitle(individualReceipt["nameOfTrip"] as? String, forState: UIControlState.Normal)
        }
        if updateLabels == false {
            cardTypeOut.setTitle("", forState: UIControlState.Normal)
            nameOfTripOut.setTitle("", forState: UIControlState.Normal)
        }
        
        if cardTypeOut.currentTitle! != "" && cardTypeOut.currentTitle! != "Add a Card in Settings" && listOfCardsItems.count > 1
        {
            cardTypeOut.enabled = true
        }
        if nameOfTripOut.currentTitle! != "" && nameOfTripOut.currentTitle! != "No Trips Exist" && tripListItems.count > 1
        {
            nameOfTripOut.enabled = true
        }
        if individualReceipt["purchaseDate"] as? String != "" {
            dateOut.setTitle(individualReceipt["purchaseDate"] as? String, forState: UIControlState.Normal)
        }
        image.image = finalReceiptImage
    }
    
    
    @IBAction func cardTypeButton(sender: AnyObject) {
        if cardTypeOut.enabled == true
        {
            pickerType = "card"
            self.performSegueWithIdentifier("chooseCardSegue", sender: self)
            cardTypeOut.setTitle(listOfCardsItems[0], forState: UIControlState.Normal)
        }
    }
    
    @IBOutlet var reminderOut: UIButton!
    @IBAction func reminderButton(sender: AnyObject) {
        let image = UIImage(named: "checked.png")as UIImage!
        let image2 = UIImage(named: "unchecked.png")
        if individualReceipt["reminders"] == true
        {
            reminderOut.setBackgroundImage(image2, forState: UIControlState.Normal)
            individualReceipt["reminders"] = false
        }
        else if individualReceipt["reminders"] == false
        {
            reminderOut.setBackgroundImage(image, forState: UIControlState.Normal)
            individualReceipt["reminders"] = true
        }
    }
    
    @IBOutlet var tripOut: UIButton!
    @IBAction func tripButton(sender: AnyObject) {
        if tripListItems.count != 0 {
            let image = UIImage(named: "checked.png")as UIImage!
            let image2 = UIImage(named: "unchecked.png")
            if individualReceipt["partOfTrip"] == false
            {
                tripOut.setBackgroundImage(image, forState: UIControlState.Normal)
                individualReceipt["partOfTrip"] = true
            }
            else if individualReceipt["partOfTrip"] == true
            {
                tripOut.setBackgroundImage(image2, forState: UIControlState.Normal)
                individualReceipt["partOfTrip"] = false
            }
            pickerType = "trip"
            if tripListItems.count == 1 {
                individualReceipt["nameOfTrip"] = tripListItems[0]
                nameOfTripOut.setTitle(individualReceipt["nameOfTrip"] as? String, forState: UIControlState.Normal)
            }
            if tripListItems.count > 1 && individualReceipt["partOfTrip"] == true {
                self.performSegueWithIdentifier("chooseTripSegue", sender: self)
            }
        }
        else {
            nameOfTripOut.setTitle("No Trips Exist", forState: UIControlState.Normal)
            nameOfTripOut.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        }
        if nameOfTripOut.enabled == true || (tripListItems.count == 1 && individualReceipt["partOfTrip"] == false) {
            nameOfTripOut.enabled = false
            nameOfTripOut.setTitle("", forState: UIControlState.Normal)
            individualReceipt["nameOfTrip"] = ""
        }
    }
    
    @IBAction func nameOfTripButton(sender: AnyObject) {
        if nameOfTripOut.enabled == true
        {
            pickerType = "trip"
            self.performSegueWithIdentifier("chooseTripSegue", sender: self)
            cardTypeOut.setTitle(tripListItems[0], forState: UIControlState.Normal)
        }
    }
    
    @IBAction func theCancelButton(sender: AnyObject) {
        let image = UIImage(named: "personalf.png")as UIImage!
        let image2 = UIImage(named: "businessuf.png")
        personalOut.setBackgroundImage(image, forState: UIControlState.Normal)
        businessOut.setBackgroundImage(image2, forState: UIControlState.Normal)
        individualReceipt["receiptType"] = "Personal"
        
        individualReceipt["itemName"] = ""
        itemPurchased.text = ""
        
        individualReceipt["itemPrice"] = ""
        purchasePrice.text = ""
        
        individualReceipt["itemPayment"] = "Cash"
        
        cardTypeOut.enabled = false
        cardTypeOut.setTitle("", forState: UIControlState.Normal)
        
        individualReceipt["returnTime"] = ""
        returnInDays.text = ""
        
        individualReceipt["reminders"] = true
        
        individualReceipt["purchasedAt"] = ""
        purchasedAt.text = ""
        
        individualReceipt["address"] = ""
        address.text = ""
        
        individualReceipt["partOfTrip"] = false
        nameOfTripOut.enabled = false
        nameOfTripOut.setTitle("", forState: UIControlState.Normal)
        
        currentReceiptItems = []
        receiptItemsList = []
        receiptPriceItemsList = []
        
        updateLabels = false
        finalReceiptImage = UIImage()
        self.performSegueWithIdentifier("backToReceiptsSegue", sender: self)
    }
    
    @IBAction func theSaveButton(sender: AnyObject) {
        var purchaseTrue = false
        var returnTrue = false
        if let mFloat = Float(purchasePrice.text!) {
            purchaseTrue = true
        }
        
        if let mInt = Int(returnInDays.text!) {
            returnTrue = true
        }
        else {
            returnInDays.text = ""
        }
        
        if returnInDays.text == "" {
            returnTrue = true
        }
        
        if (itemPurchased != "" && purchasePrice != "" && purchasedAt != "" && purchaseTrue && returnTrue) {
            var textdate = ""
            if returnInDays.text != "" {
                var dateFormatter:NSDateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                var date = dateFormatter.dateFromString(dateOut.titleLabel!.text!)
                var newdate = NSCalendar.currentCalendar().dateByAddingUnit(
                    .Day,
                    value: Int(returnInDays.text!)!,
                    toDate: date!,
                    options: NSCalendarOptions(rawValue: 0))
                textdate = dateFormatter.stringFromDate(newdate!)
            }
            data.append([
                "receiptImage": finalReceiptImage,
                "receiptType": individualReceipt["receiptType"]!,
                "receiptBackground": individualReceipt["receiptType"]!,
                "receiptPageBackground": individualReceipt["receiptType"]!,
                "receiptCost": purchasePrice.text!,
                "purchaseMethod": individualReceipt["itemPayment"]!,
                "cardType": individualReceipt["cardType"]!,
                "purchaseDate": dateOut.titleLabel!.text!,
                "returnBy": textdate,
                "returnTime": returnInDays.text!,
                "keeping": "Keeping it",
                "noKeepSwitch": false,
                "reminders": individualReceipt["reminders"]!,
                "purchasedAt": purchasedAt.text!,
                "address": address.text!,
                "partOfTrip": individualReceipt["partOfTrip"]!,
                "nameOfTrip": individualReceipt["nameOfTrip"]!,
                "receiptName": itemPurchased.text!,
                "items": currentReceiptItems
                ])
            print(data)
            
            if (individualReceipt["reminders"] == true && listOfRemindersItems.count != 0) {
                for i in listOfRemindersItems {
                    print(i)
                    print(returnInDays.text)
                    if Int(i) < Int(returnInDays.text!)! {
                        var dateFormatter:NSDateFormatter = NSDateFormatter()
                        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                        var dater = dateFormatter.dateFromString(dateOut.titleLabel!.text!)
                        var newdater = NSCalendar.currentCalendar().dateByAddingUnit(
                            .Day,
                            value: Int(returnInDays.text!)!,
                            toDate: dater!,
                            options: NSCalendarOptions(rawValue: 0))
                        var returningReminder = NSCalendar.currentCalendar().dateByAddingUnit(
                            .Day,
                            value: (-1 * Int(i)!),
                            toDate: newdater!,
                            options: NSCalendarOptions(rawValue: 0))
                        
                        guard let settings = UIApplication.sharedApplication().currentUserNotificationSettings() else { return }
                        if settings.types == .None {
                            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
                            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                            presentViewController(ac, animated: true, completion: nil)
                            return
                        }
                        
                        let notification = UILocalNotification()
                        notification.fireDate = returningReminder
                        var daysLeft = Int(i)! + 1
                        notification.alertBody = "You have " + String(daysLeft) + " days left to return your receipt, " + itemPurchased.text!
                        notification.alertAction = "go to receipt"
                        notification.soundName = UILocalNotificationDefaultSoundName
                        notification.userInfo = ["CustomField1": "w00t"]
                        UIApplication.sharedApplication().scheduleLocalNotification(notification)
                    }
                }
            }
            
            let image = UIImage(named: "personalf.png")as UIImage!
            let image2 = UIImage(named: "businessuf.png")
            personalOut.setBackgroundImage(image, forState: UIControlState.Normal)
            businessOut.setBackgroundImage(image2, forState: UIControlState.Normal)
            individualReceipt["receiptType"] = "Personal"
            
            individualReceipt["itemName"] = ""
            itemPurchased.text = ""
        
            individualReceipt["itemPrice"] = ""
            purchasePrice.text = ""
        
            individualReceipt["itemPayment"] = "Cash"
        
            cardTypeOut.enabled = false
            cardTypeOut.setTitle("", forState: UIControlState.Normal)
        
            individualReceipt["returnTime"] = ""
            returnInDays.text = ""
        
            individualReceipt["reminders"] = true
        
            individualReceipt["purchasedAt"] = ""
            purchasedAt.text = ""
        
            individualReceipt["address"] = ""
            address.text = ""
            
            var today:NSDate = NSDate()
            var dateFormatter:NSDateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            individualReceipt["purchaseDate"] = dateFormatter.stringFromDate(today)
        
            individualReceipt["partOfTrip"] = false
            nameOfTripOut.enabled = false
            nameOfTripOut.setTitle("", forState: UIControlState.Normal)

            currentReceiptItems = []
            receiptItemsList = []
            receiptPriceItemsList = []
        
            updateLabels = false
            finalReceiptImage = UIImage()
            self.performSegueWithIdentifier("backToReceiptsSegue", sender: self)
        }
        else {
            if (itemPurchased.text == "") {
                itemPurchased.text = "Please enter a receipt name!"
            }
            if (purchasePrice.text == "") {
                purchasePrice.text = "Please enter a valid cost!"
            }
            if (purchasedAt.text == "") {
                purchasedAt.text = "Please enter a purchase location!"
            }
            if !purchaseTrue {
                purchasePrice.text = "Please enter a valid cost!"
            }
            if !returnTrue {
                returnInDays.text = ""
            }
        }
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}