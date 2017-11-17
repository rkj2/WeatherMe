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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(with weather: Weather) {
        self.label.text = weather.locationName
        let iconUrl = weather.weatherIconString(at: 0)
        if !iconUrl.isEmpty {
            let completeUrl = WeatherWebService.urlString(for: iconUrl)
            self.weatherIcon.sd_setImage(with: completeUrl)
        }
    }
    
}
