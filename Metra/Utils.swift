//
//  Utils.swift
//  Metra
//
//  Created by Ruslan on 1/17/17.
//  Copyright © 2017 Ruslan. All rights reserved.
//

import Foundation

func formatDate(date: Date) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    
    let dateString = dateFormatter.string(from: Date())
    return dateString
    
}
