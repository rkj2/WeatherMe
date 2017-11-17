//
//  Weather.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation

class Weather : NSObject, NSCoding {
    var locationName: String
    var humidity: String
    var maxTemperature: String
    var minTemperature: String
    var weather: [[String: Any]]?
    
    let keyLocation = "location"
    let keyHumidity = "humidity"
    let keyMaxTemperature = "maxTemperature"
    let keyMinTemperature = "minTemperature"
    let keyWeatherArray = "weatherArray"
    
    init?(json: [String: Any]) {
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
    
    required init?(coder aDecoder: NSCoder) {
        locationName = (aDecoder.decodeObject(forKey: keyLocation) as? String)!
        humidity = (aDecoder.decodeObject(forKey: keyHumidity) as? String)!
        maxTemperature = (aDecoder.decodeObject(forKey: keyMaxTemperature) as? String)!
        minTemperature = (aDecoder.decodeObject(forKey: keyMinTemperature) as? String)!
        weather = aDecoder.decodeObject(forKey: keyWeatherArray) as? [[String: Any]]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.locationName, forKey: keyLocation)
        aCoder.encode(self.humidity, forKey: keyHumidity)
        aCoder.encode(self.maxTemperature, forKey: keyMaxTemperature)
        aCoder.encode(self.minTemperature, forKey: keyMinTemperature)
        aCoder.encode(self.weather, forKey: keyWeatherArray)
    }
}

extension Weather {
    
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
