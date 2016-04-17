//
//  receiptController.swift
//  iReceipts
//
//  Created by George Saieed on 4/16/16.
//  Copyright © 2016 George Saieed. All rights reserved.
//

import UIKit
var aGlobalReceipt = data[0]
class receiptController: UITableViewController, receiptTableCellDelegate {
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        print(data)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("receiptCell") as! receiptTableCell!
        
        let receipt = data[indexPath.row]
        cell.configureWithReceipt(receipt)
        cell.delegate = self
        
        return cell
    }
    
    //CHANGE LATER FOR SEGUING TO RECEIPTS
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let receipt = data[indexPath.row]
        aGlobalReceipt = receipt
        performSegueWithIdentifier("ReceiptSegue", sender: self)
    }
    
    func receiptTableCellDidTouchDelete(cell: receiptTableCell, sender: AnyObject) {
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            deleteReceiptIndexPath = indexPath
            let receiptToDelete = data[indexPath.row]
            confirmDelete(receiptToDelete)
        }
    }
    
    var deleteReceiptIndexPath: NSIndexPath? = nil
    
    func confirmDelete(receipt: AnyObject) {
        let alert = UIAlertController(title: "Delete Receipt", message: "Are you sure you want to permanently delete this receipt?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeleteReceipt)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeleteReceipt)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support display in iPad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func handleDeleteReceipt(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deleteReceiptIndexPath {
            tableView.beginUpdates()
            
            data.removeAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deleteReceiptIndexPath = nil
            
            tableView.endUpdates()
        }
    }
    
    func cancelDeleteReceipt(alertAction: UIAlertAction!) {
        deleteReceiptIndexPath = nil
    }

}
