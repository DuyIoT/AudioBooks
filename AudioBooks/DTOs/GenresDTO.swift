//
//  GenresDTO.swift
//  AudioBooks
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON
class GenresDTO {
    var genreId: Int
    var name: String
    var url: String
    init(_ json: JSON) {
        self.genreId = json["genreId"].intValue
        self.name = json["name"].stringValue
        self.url = json["url"].stringValue
    }
}
