//
//  JSONDownloader.swift
//  Stormy
//
//  Created by anna.sibirtseva on 17/04/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class JSONDownloader {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
            self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    typealias JSON = [String: AnyObject]
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping (JSON?, DarkSkyError?) -> Void) -> URLSessionDataTask {
        let tast = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
        }
        return task
    }
}
