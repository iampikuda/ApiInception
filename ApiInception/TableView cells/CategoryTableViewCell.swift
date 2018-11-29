//
//  CategoryTableViewCell.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import Foundation

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!


    func addText(_ text: String) {
        self.categoryNameLabel.text = text
    }
}
