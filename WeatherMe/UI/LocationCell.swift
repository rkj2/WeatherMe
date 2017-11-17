//
//  LocationCell.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation
import UIKit

class LocationCell : UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(with weather: Weather, at index: Int) {
        self.label.text = weather.locationName
        self.weatherDescription.text = weather.fullDescription
        let iconUrl = weather.weatherIconString(at: index)
        if !iconUrl.isEmpty {
            let completeUrl = WeatherWebService.urlString(for: iconUrl)
            self.weatherIcon.sd_setImage(with: completeUrl)
            self.minTempLabel.text = weather.metricMinTemp
            self.maxTempLabel.text = weather.metricMaxTemp
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.weatherIcon.image = nil
        self.minTempLabel.text = ""
        self.maxTempLabel.text = ""
        self.label.text = ""
        self.weatherDescription.text = ""
    }
    
}
