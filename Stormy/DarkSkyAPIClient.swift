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
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias WeatherCompletionHandler = (Weather?, Error?) -> Void
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    
    private func getWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, DarkSkyError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async{
            if let data = data {
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, DarkSkyError.requestFailed)
                    return
                }
                if httpResponse.statusCode == 200 {
                    do {
                       let weather = try self.decoder.decode(Weather.self, from: data)
                        completion(weather, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                } else {
                    completion(nil, DarkSkyError.invalidData)
                }
            } else if let error = error {
                completion(nil, error)
            }
        }
    }
        task.resume()
    }
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getWeather(at: coordinate) {weather, error in
            completion(weather?.currently, error)
        }
    }
}
