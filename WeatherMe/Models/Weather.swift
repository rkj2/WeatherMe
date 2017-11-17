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
    var humidity: String
    var maxTemperature: String
    var minTemperature: String
    var weather: [[String: Any]]?
    
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
        
        if weatherArray.count > 0 {
            self.weather = weatherArray
        }
    }
    
    func weatherIconString(at index: Int) -> String {
        return self.weather![index]["icon"]! as! String
    }
    
    func weatherDescription(at index: Int) -> String {
        return self.weather![index]["description"] as! String
    }
}

extension Weather {
    var fullDescription: String {
        var description = [String]()
        for item in self.weather! {
            let nextDescription = item["description"] as! String
            description.append(nextDescription)
        }
        
        let separator = ", "
        let full  = description.joined(separator: separator)
        return full
    }
    
    var metricMinTemp: String {
        return "\(self.minTemperature) C"
    }
    
    var metricMaxTemp: String {
        return "\(self.maxTemperature) C"
    }
    
    var humidityString: String {
        return "\(self.humidity)%"
    }
}
