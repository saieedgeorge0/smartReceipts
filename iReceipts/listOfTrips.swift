//
//  listOfTrips.swift
//  iReceipts
//
//  Created by George Saieed on 9/10/15.
//  Copyright (c) 2015 George Saieed. All rights reserved.
//

import Foundation
import UIKit
var tripListItems = [String]()
var tempTripID: Int = 0

class listOfTrips: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tripList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tripList.delegate = self
        self.tripList.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        tripList.reloadData()
    }
    
    @IBAction func addTrip(sender: AnyObject) {
        tripListItems.append("New Trip - Tap to Edit")
        tripList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripListItems.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TripCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = tripListItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tripListItems.removeAtIndex(indexPath.row)
            tripList.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tempTripID = indexPath.row
    }
    
}