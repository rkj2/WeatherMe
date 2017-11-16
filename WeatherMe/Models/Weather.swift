//
//  Weather.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation

struct Weather {
    var id: String
    var zipCode: String
    var locationName: String
    var mainWeather: String
    var weatherDescription: String
    var icon: String
    var maxTemperature: String
    var minTemperature: String
    var humidity: String
}

extension Weather {
    var fullDescription: String {
        return "Weather at \(self.locationName)"
    }
}
