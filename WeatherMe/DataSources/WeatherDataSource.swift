//
//  WeatherDataSource.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView
    var weatherService: WeatherWebService
    var locationWeather: Weather?
    
    init(with service: WeatherWebService, for view: UITableView) {
        self.weatherService = service
        self.tableView = view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            if self.locationWeather != nil {
                cell.populate(with: self.locationWeather!, at: indexPath.row)
            }
            return cell
        } else {
            let weatherCell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
            weatherCell.populate(with: self.locationWeather!, at: indexPath.row - 1)
            return weatherCell
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.locationWeather != nil {
            return (self.locationWeather?.weather?.count)! + 1
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else {
            return 80
        }
    }
    
}

extension WeatherDataSource {
    func fetchData(for city: String) {
        self.weatherService.fetchWeather(for: city) { (dictionary) in
            if let weather = Weather(json: dictionary) {
                self.locationWeather = weather
                print("weather array: \(self.locationWeather?.weather?.count)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
