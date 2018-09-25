//
//  APIRequestProvider.swift
//  AudioBooks
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
class APIRequestProvider: NSObject {
    var alamoFireManager: SessionManager
    private override init() {
        alamoFireManager = SessionManager.default
    }
    static var sharedInstand: APIRequestProvider = {
        let instand = APIRequestProvider()
        return instand
    }()
    
    func audioBooksRequest() -> DataRequest {
        let  urlRequest = "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/30/explicit.json"
        return alamoFireManager.request(urlRequest,
                                        method: .get,
                                        parameters: nil,
                                        encoding: URLEncoding.default,
                                        headers: nil)
        
    }
}
