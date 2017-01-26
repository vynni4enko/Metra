//
//  MetraTableViewController.swift
//  Metra
//
//  Created by Ruslan on 1/17/17.
//  Copyright © 2017 Ruslan. All rights reserved.
//

import UIKit
import Firebase

class MetraTableViewController: UITableViewController {
    
    var firebaseRef: FIRDatabaseReference!
    
    var sections = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseRef = FIRDatabase.database().reference(withPath: "Sections")
        
        loadDataFromFirebase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! CustomSectionTableViewCell

        // Configure the cell...
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }

    //MARK: - Config cell
    func configureCell(cell: CustomSectionTableViewCell, indexPath: IndexPath) {
        
        let sectionList = sections[indexPath.row]
        cell.sectionNameLabel?.text = sectionList.sectionName
        
        let lastDateTimeInterval = sectionList.lastDate as TimeInterval
        populateDate(cell: cell, timeInterval: lastDateTimeInterval)
        
    }

    //MARK: - Populate date
    func populateDate(cell: CustomSectionTableViewCell, timeInterval: TimeInterval) {
        
        let date = Date(timeIntervalSinceNow: timeInterval)
        let dateString = formatDate(date: date)
        
        cell.lastDateLabel?.text = dateString
        
    }
    
    //MARK: - Load data from Firebase
    func loadDataFromFirebase() {
        
        firebaseRef.observe(.value, with: { (snapshot) in
            
            var newSection = [Section]()
            
            for list in snapshot.children {
                let sectionList = Section(snapshot: list as! FIRDataSnapshot)
                newSection.append(sectionList)
            }
            
            self.sections = newSection
            self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    @IBAction func unwindToMetra(seque: UIStoryboardSegue) {
    }
    
}
