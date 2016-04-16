//
//  individualCard.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit

class individualCard: UIViewController {

    
    @IBOutlet var saved: UILabel!
    @IBOutlet var cardName: UITextField!
    @IBAction func saveCard(sender: AnyObject) {
        var aCard = cardName.text!
        listOfCardsItems.append(aCard)
        saved.text = "Saved!"
        cardName.text = ""
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