//
//  Section.swift
//  Metra
//
//  Created by Ruslan on 1/19/17.
//  Copyright © 2017 Ruslan. All rights reserved.
//

import Foundation
import Firebase

class Section {
    
    let sectionName: String!
    //let description: String!
    let lastDate: Double!
    //let overall: Int!
    
    init (snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! NSDictionary
        
        self.sectionName = snapshotValue["name"] as! String
        //self.description = snapshotValue["description"] as! String
        self.lastDate = snapshotValue["lastDate"] as! Double
        //self.overall = snapshotValue["overall"] as! Int
        
    }
    
}
