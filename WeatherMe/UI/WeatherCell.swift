//
//  WeatherCell.swift
//  WeatherMe
//
//  Created by Rajive Jain on 11/16/17.
//  Copyright © 2017 Rajive Jain. All rights reserved.
//

import Foundation

class WeatherCell : UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(with weather: Weather, at index: Int) {
        let description = weather.weatherDescription(at: index)
        self.weatherDescription.text = description.uppercased()
        let iconUrl = weather.weatherIconString(at: index)
        if !iconUrl.isEmpty {
            let completeUrl = WeatherWebService.urlString(for: iconUrl)
            self.weatherIcon.sd_setImage(with: completeUrl)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.weatherDescription.text = ""
        self.weatherIcon.image = nil
    }
}
