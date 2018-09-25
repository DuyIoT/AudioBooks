//
//  AudioBooksService.swift
//  AudioBooks
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON
class AudioBooksService: APIServiceObject {
    func audioBooksRequest(completion: @escaping ([AudioDTO]?, String?) -> Void) {
        var audioBooks: [AudioDTO] = []
        let audioRquest = APIRequestProvider.sharedInstand.audioBooksRequest()
        serviceAgent.startRequest(audioRquest) { (json, error) in
            if let error = error {
                completion(nil, error.localizedDescription)
            } else {
                let data = json["feed"]["results"].arrayValue
                for item in data {
                    audioBooks.append(AudioDTO(item))
                }
                completion(audioBooks, nil)
            }
        }
    }
}
