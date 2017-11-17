//
//  WeatherWebService.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation

class WeatherWebService: Fetcher {
    
    func fetchWeather(for city: String?, completion: @escaping ([String: Any]) -> ()) {
        
        guard city != nil else {
            return
        }
        
        if let url = self.weatherUrl(for: city!) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print("error \(String(describing: error))")
                    completion([:])
                    return
                }
                
                if let data = data, let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(jsonData!)
                }
            }).resume()
        }
    }
    
    // Example call api.openweathermap.org/data/2.5/weather?zip=94040,us
    
    private func weatherUrl(for city: String) -> URL? {
        
        if city.characters.count > 0 {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.openweathermap.org"
            components.path = "/data/2.5/weather"
            
            let keyItem = URLQueryItem(name: "appid", value: "1272cf4e833e48fa198f0134dd77b092")
            let zipItem = URLQueryItem(name: "q", value: city)
            let unitsTerm = URLQueryItem(name: "units", value: "metric")
            components.queryItems = [keyItem, zipItem, unitsTerm]
            return components.url
        } else {
            return nil
        }
    }
    
    static func urlString(for icon: String) -> URL? {
        
        // http://openweathermap.org/img/w/10d.png
        
        if icon.characters.count > 0 {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "openweathermap.org"
            let imageName = "\(icon).png"
            components.path = "/img/w/\(imageName)"
            return components.url
        } else {
            return nil
        }
    }
}
