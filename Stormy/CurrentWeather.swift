//
//  CurrentWeather.swift
//  Stormy
//
//  Created by anna.sibirtseva on 16/04/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let humidity: Double
    let precipProbability: Double
    let summary: String
    let icon: String
}

extension CurrentWeather {
    var iconImage: UIImage {
        //return UIImage(imageLiteralResourceName: icon) will crash in case of tornado
        switch icon {
        case "clear-day": return #imageLiteral (ResourceName: "clear-day")
        case "clear-night": return #imageLiteral(resourceName: "clear-night")
        case "rain": return #imageLiteral(resourceName: "rain")
        case "snow": return #imageLiteral(resourceName: "snow")
        case "sleet": return #imageLiteral(resourceName: "sleet")
        case "wind": return #imageLiteral(resourceName: "wind")
        case "fog": return #imageLiteral(resourceName: "fog")
        case "cloudy": return #imageLiteral(resourceName: "cloudy")
        case "partly-cloudy-day": return #imageLiteral(resourceName: "partly-cloudy-day")
        case "partly-clody-night": return #imageLiteral(resourceName: "partly-cloudy-night")
        default: return #imageLiteral(resourceName: "default")
       }
    }
}
    extension CurrentWeather {
        struct Key {
            static let temperature = "temperature"
            static let humidity = "humidity"
            static let precipitationProbability = "precipProbability"
            static let summary = "summary"
            static let icon = "icon"
        }
    
        init?(json: [String: AnyObject]) {
            guard let tempValue = json[Key.temperature] as? Double,
            let humidityValue = json[Key.humidity] as? Double,
            let precipitationProbabilityValue = json[Key.precipitationProbability] as? Double,
            let summaryString = json[Key.summary] as? String,
                let iconString = json[Key.icon] as? String else {
                    return nil
            }
            
            self.temperature = tempValue
            self.humidity = humidityValue
            self.precipProbability = precipitationProbabilityValue
            self.summary = summaryString
            self.icon = iconString
            
        }
    }

