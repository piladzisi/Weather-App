//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by anna.sibirtseva on 16/04/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation
import UIKit


struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        
        let precipitationPercentValue = Int(model.precipProbability * 100)
        self.precipitationProbability = "\(precipitationPercentValue)%"
        
        self.summary = model.summary
        self.icon = model.iconImage
    }
    
}

