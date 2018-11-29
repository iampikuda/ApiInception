//
//  EntryTableViewCell.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var entryDescriptionTextView: UITextView!
    
    func bindData(category: String, description: String) {
        self.entryNameLabel.text = category
        self.entryDescriptionTextView.text = description
    }
}
