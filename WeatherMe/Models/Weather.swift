//
//  Weather.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation

struct Weather {
    var locationName: String
    var mainWeather: String?
    var icon: String?
    var humidity: String
    var maxTemperature: String
    var minTemperature: String
    
    init?(json: [String: Any]) {
        print("json before parsing \n \(json)")
        guard
            let locationName = json["name"] as? String,
            let weatherArray = json["weather"] as? [[String:Any]],
            let mainDict = json["main"] as? [String: Any]
        else {
            return nil
        }
        
        self.locationName = locationName
        self.humidity = "\(mainDict["humidity"]!)"
        self.maxTemperature = "\(mainDict["temp_max"]!)"
        self.minTemperature = "\(mainDict["temp_min"]!)"
        
        if let weatherArrayFirst = weatherArray.first {
            self.mainWeather = weatherArrayFirst["description"] as? String
            self.icon = weatherArrayFirst["icon"] as? String
        }
    }
}

extension Weather {
    var fullDescription: String {
        return "Weather at \(self.locationName)"
    }
}
