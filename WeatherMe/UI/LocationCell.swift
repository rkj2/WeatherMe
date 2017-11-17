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
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(with weather: Weather, at index: Int) {
        self.label.text = weather.locationName
            self.minTempLabel.text = weather.metricMinTemp
            self.maxTempLabel.text = weather.metricMaxTemp
           self.humidityLabel.text = weather.humidityString
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.minTempLabel.text = ""
        self.maxTempLabel.text = ""
        self.label.text = ""
    }
    
}
