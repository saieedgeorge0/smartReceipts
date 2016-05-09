//
//  ViewController.swift
//  iReceipts
//
//  Created by George Saieed on 9/7/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import UIKit
var titleFont = UILabel()
var receiptReturned = false
class singleReceipt: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var purchaseType: UILabel!
    @IBOutlet var purchaseName: UILabel!
    @IBOutlet var purchasePrice: UILabel!
    @IBOutlet var purchaseMethod: UILabel!
    @IBOutlet var purchaseDate: UILabel!
    @IBOutlet var returnBy: UILabel!
    @IBOutlet var tripName: UILabel!
    @IBOutlet var timeRemaining: UILabel!
    @IBOutlet var purchasePlace: UILabel!
    @IBOutlet var purchaseAddress: UILabel!
    @IBOutlet var keepingIt: UILabel!
    @IBOutlet var keepingSwitch: UISwitch!
    @IBOutlet var receiptImage: UIImageView!
    @IBOutlet var receiptBackground: UIImageView!
    @IBOutlet var receiptsItems: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view, typically from a nib.
        let receiptI = aGlobalReceipt["receiptImage"] as! UIImage
        let receiptB = UIImage(named: ((aGlobalReceipt["receiptPageBackground"] as? String)!+"back.png"))
        makeRoundImage()
        print((aGlobalReceipt["receiptPageBackground"] as? String)! + "back.png")
        let receiptN = aGlobalReceipt["receiptName"] as? String
        let receiptT = aGlobalReceipt["receiptType"] as? String
        let receiptC = aGlobalReceipt["receiptCost"] as? String
        let purchaseM = aGlobalReceipt["purchaseMethod"] as? String
        let cardT = aGlobalReceipt["cardType"] as? String
        let purchaseD = aGlobalReceipt["purchaseDate"] as? String
        let returnB = aGlobalReceipt["returnBy"] as? String
        let returnT = aGlobalReceipt["returnTime"] as? String
        let keepin = aGlobalReceipt["keeping"] as? String
        let onOrNah = aGlobalReceipt["noKeepSwitch"] as? Bool
        let reminder = aGlobalReceipt["reminds"] as? String
        let purchasedA = aGlobalReceipt["purchasedAt"] as? String
        let addr = aGlobalReceipt["address"] as? String
        let partTrip = aGlobalReceipt["partOfTrip"] as? Bool
        let nameTrip = aGlobalReceipt["nameOfTrip"] as? String
        
        var returnDistanceString = ""
        if returnT != "" {
            var dateFormatter:NSDateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            var todaysDate:NSDate = NSDate()
            var boughtOn = todaysDate
            var needToReturnBy = dateFormatter.dateFromString(aGlobalReceipt["returnBy"] as! String)
            var returnDistanceSec = needToReturnBy!.timeIntervalSinceDate(todaysDate)
            var returnDistanceDays = returnDistanceSec/(86400.0)
            var returnDistanceDaysInt = Int(returnDistanceDays+2)
            returnDistanceString = String(returnDistanceDaysInt)
        }
        
        purchaseName.text = receiptN
        purchaseType.text = receiptT! + " Purchase"
        purchasePrice.text = "$" + String(format:"%.2f", Float(receiptC!)!)
        if (purchaseM == "Card") {
            purchaseMethod.text = cardT
        }
        else if (purchaseM == "Cash") {
            purchaseMethod.text = purchaseM
        }
        purchaseDate.text = "Purchased On: " + purchaseD!
        
        if returnB != "" {
            returnBy.text = "Return By: " + returnB!
        }
        if returnB == "" {
            returnBy.text = returnB!
        }
        
        if partTrip == true {
            tripName.text = "Trip: " + nameTrip!
        }
        
        if returnDistanceString != "" && Int(returnDistanceString) != 0 && Int(returnDistanceString) > 0 {
            timeRemaining.text = returnDistanceString + " day(s) remaining"
        }
        else {
            timeRemaining.text = "Not returnable"
        }
        
        if timeRemaining.text == "Not returnable" {
            keepingSwitch.setOn(false, animated:false)
            keepingSwitch.enabled = false
        }
        
        if keepingSwitch.enabled == false {
            aGlobalReceipt["keeping"] = ""
            keepingIt.text = ""
        }
        
        if onOrNah == true {
            keepingSwitch.setOn(true, animated:false)
            keepingSwitch.enabled = false
        }
        
        purchasePlace.text = purchasedA
        purchaseAddress.text = addr
        receiptImage.image = receiptI
        receiptBackground.image = receiptB
        receiptsItems.reloadData()

    }
    
    override func viewDidAppear(animated: Bool) {
        self.receiptsItems.delegate = self
        self.receiptsItems.dataSource = self
        receiptsItems.reloadData()
    }
    
    private func makeRoundImage() {
        self.receiptImage.layer.cornerRadius = 40.0
        self.receiptImage.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let theReceiptItems = aGlobalReceipt["items"]
        print(aGlobalReceipt["items"])
        print(theReceiptItems!.count)
        return theReceiptItems!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let theReceiptItems = aGlobalReceipt["items"]
        let item = tableView.dequeueReusableCellWithIdentifier("anItemCell", forIndexPath: indexPath) as! UITableViewCell
        item.textLabel?.text = ((theReceiptItems?[indexPath.row]["name"])! as! String) + " - $" + ((theReceiptItems?[indexPath.row]["price"])! as! String)
        titleFont.font = UIFont(name: "HelveticaNeue-Thin", size: 14)!
        item.textLabel?.font = titleFont.font
        return item
    }
    
    @IBAction func clickedReturn(sender: AnyObject) {
        aGlobalReceipt["noKeepSwitch"] = true
        data[currentIndex]["noKeepSwitch"] = true
        viewDidLoad()
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}


