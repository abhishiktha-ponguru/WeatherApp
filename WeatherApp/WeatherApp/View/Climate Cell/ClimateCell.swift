//
//  ClimateCell.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation
import UIKit

class ClimateCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var weatherConditionLabel: UILabel?
    @IBOutlet weak var temperatureLabel: UILabel?
    @IBOutlet weak var windSpeedLabel: UILabel?
    @IBOutlet weak var weatherIcon: UIImageView?
    @IBOutlet weak var windIcon: UIImageView?
    
    var dateFormatter: DateFormatter?
    var dataSource: Climate?
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        timeLabel?.text = dataSource?.dt_txt?.calculateTime(dateFormatter ?? DateFormatter(), false)
        weatherConditionLabel?.text = dataSource?.weatherDescription
        windSpeedLabel?.text = dataSource?.windSpeed
        temperatureLabel?.text = String(format: "H: %@    L: %@", dataSource?.maxTemperature ?? "", dataSource?.minTemperature ?? "")
    }
}
