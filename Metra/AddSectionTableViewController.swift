//
//  AddSectionTableViewController.swift
//  Metra
//
//  Created by Ruslan on 1/17/17.
//  Copyright © 2017 Ruslan. All rights reserved.
//

import UIKit
import Firebase

class AddSectionTableViewController: UITableViewController {
    
    @IBOutlet weak var sectionNameTextField: UITextField!
    @IBOutlet weak var sectionDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func saveSection(sender: AnyObject){
        
        let firebaseRef = FIRDatabase.database().reference()
        
        let name = sectionNameTextField.text
        let description = sectionDescriptionTextView.text
        
        let lastDate = NSDate().timeIntervalSinceNow
        
        let newSection: NSDictionary = ["name": name!,
                                        "description": description!,
                                        "lastDate": lastDate,
                                        "overall": "0",
                                        "lastName": " "]
        
        //add firebase child node with information about new section
        firebaseRef.child("Sections").childByAutoId().setValue(newSection)
        
        dismiss(animated: true, completion: nil)
    }
    
}
