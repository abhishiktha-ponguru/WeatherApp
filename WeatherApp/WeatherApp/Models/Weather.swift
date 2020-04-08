//
//  Weather.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/7/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

struct ClimateForecast: Codable {
    var list: [Climate]?
}

struct Climate: Codable {
    var dt_txt: String?
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    
    var minTemperature: String {
        return main?.temp_min?.asDegrees() ?? ""
    }
    
    var maxTemperature: String {
        return main?.temp_max?.asDegrees() ?? ""
    }
    
    var weatherDescription: String {
        return weather?.first?.description ?? ""
    }
    
    var windSpeed: String {
        return "\(wind?.speed?.asString() ?? "") \(WeatherUnits.windUnits)"
    }
}

struct Weather: Codable {
    var description: String?
}

struct Main: Codable {
    var temp_min: Double?
    var temp_max: Double?
}

struct Wind: Codable {
    var speed: Double?
}
