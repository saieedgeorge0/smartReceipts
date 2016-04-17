//
//  ViewController.swift
//  iReceipts
//
//  Created by George Saieed on 9/7/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import UIKit

class singleReceipt: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let receiptI = aGlobalReceipt["receiptImage"] as! UIImage
        let receiptB = UIImage(named: ((aGlobalReceipt["receiptPageBackground"] as? String)!+"back.png"))
        makeRoundImage()
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
        
        purchaseName.text = receiptN
        purchaseType.text = receiptT
        purchasePrice.text = "$" + receiptC!
        if (purchaseM == "Card") {
            purchaseMethod.text = cardT
        }
        else if (purchaseM == "Cash") {
            purchaseMethod.text = purchaseM
        }
        purchaseDate.text = "Purchased On: " + purchaseD!
        returnBy.text = "Return By: " + returnB!
        if partTrip == true {
            tripName.text = "Trip: " + nameTrip!
        }
        timeRemaining.text = returnT! + " days remaining"
        purchasePlace.text = purchasedA
        purchaseAddress.text = addr
        keepingIt.text = keepin
        keepingSwitch.setOn(onOrNah!, animated: true)
        receiptImage.image = receiptI
        receiptBackground.image = receiptB

    }
    
    private func makeRoundImage() {
        self.receiptImage.layer.cornerRadius = 40.0
        self.receiptImage.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



