//
//  Entry.swift
//  ApiInception
//
//  Created by Oluwadamisi Pikuda on 29/11/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit
import Foundation

struct EntryObject: Codable {
    var count: Int
    var entries: [Entry]
}

struct Entry: Codable {
    var api: String
    var description: String
    var auth: String
    var https: Bool
    var cors: String
    var link: String
    var category: String

    enum CodingKeys: String, CodingKey {
        case api = "API"
        case description = "Description"
        case auth = "Auth"
        case https = "HTTPS"
        case cors = "Cors"
        case link = "Link"
        case category = "Category"
    }
}

