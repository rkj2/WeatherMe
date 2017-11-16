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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        cell.label.text = "hello"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension WeatherDataSource {
    func fetchData(for city: String) {
        self.weatherService.fetchWeather(for: city) { (dictionary) in
            if let weather = Weather(json: dictionary) {
                self.locationWeather = weather
                self.tableView.reloadData()
            }
        }
    }
}
