//
//  PersistenceService.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation

class PersistenceService {
    
    func save(weather: Weather) {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: weather)
        let defaults = UserDefaults.standard
        defaults.set(savedData, forKey: "lastCity")
    }
    
    func getLastCityWeather() -> Weather? {
        let defaults = UserDefaults.standard
        if let weatherData = defaults.object(forKey: "lastCity") as? Data {
            let weather = NSKeyedUnarchiver.unarchiveObject(with: weatherData) as! Weather
            return weather
        } else {
            return nil
        }
    }
}
