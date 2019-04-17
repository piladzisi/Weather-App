//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by anna.sibirtseva on 17/04/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
     fileprivate let darkSkyApiKey = "ee665144eef0ffd3a16a6668cbf22578"
    
        lazy var baseUrl: URL = {
            return URL(string: "https://api.darksky.net/forecast/\(self.darkSkyApiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping( CurrentWeather?, DarkSkyError?) -> Void) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            
        }
    }
}
