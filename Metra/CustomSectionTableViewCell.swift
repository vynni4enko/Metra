//
//  CustomSectionTableViewCell.swift
//  Metra
//
//  Created by Ruslan on 1/25/17.
//  Copyright © 2017 Ruslan. All rights reserved.
//

import UIKit

class CustomSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var lastDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
