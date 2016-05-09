//
//  creditCardList.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit
var listOfRemindersItems = [String]()
class remindersList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var listOfReminders: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.listOfReminders.delegate = self
        self.listOfReminders.dataSource = self
        listOfReminders.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        listOfReminders.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfRemindersItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReminderCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = listOfRemindersItems[indexPath.row] + " days before"
        titleFont.font = UIFont(name: "HelveticaNeue-Light", size: 18)!
        cell.textLabel?.font = titleFont.font
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            listOfRemindersItems.removeAtIndex(indexPath.row)
            listOfReminders.reloadData()
        }
    }
}