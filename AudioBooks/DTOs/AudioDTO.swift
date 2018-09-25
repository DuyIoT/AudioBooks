//
//  AudioDTO.swift
//  AudioBooks
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON
class AudioDTO {
    var artistName: String
    var id: Int
    var name: String
    var kind: String
    var copyright: String
    var artistId: Int
    var artistUrl: String
    var artworkUrl100: String
    var genres: [GenresDTO]
    init(_ json: JSON) {
        self.artistName = json["artistName"].stringValue
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.kind = json["kind"].stringValue
        self.copyright = json["copyright"].stringValue
        self.artistId = json["artistId"].intValue
        self.artistUrl = json["artistUrl"].stringValue
        self.artworkUrl100 = json["artworkUrl100"].stringValue
        genres = [GenresDTO]()
        let data = json["genres"].arrayValue
        for item in data {
            genres.append(GenresDTO(item))
        }
    }
}
