//
//  creditCardList.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit
var listOfCardsItems = [String]()
class creditCardList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var listOfCards: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.listOfCards.delegate = self
        self.listOfCards.dataSource = self
        listOfCards.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        listOfCards.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCardsItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CardCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = listOfCardsItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            listOfCardsItems.removeAtIndex(indexPath.row)
            listOfCards.reloadData()
        }
    }
}