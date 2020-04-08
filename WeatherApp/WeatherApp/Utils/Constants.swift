//
//  Constants.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

struct DayType {
    static let today = "Today"
    static let tomorrow = "Tomorrow"
}

struct TableCell {
    static let climateCell = "ClimateCell"
}

struct ScreenName {
    static let weatherApp = "WeatherApp"
    static let weatherDetails = "Weather Details"
    static let weatherForecast = "Weather Forecast"
}

struct Segues {
    static let details = "Details"
}

struct DateFormat {
    static let fullDateTime = "YYYY-MM-dd HH:mm:ss"
    static let time24Hours = "HH:mm:ss"
    static let time12Hours = "hh:mm:ss a"
    static let fullDate = "yyyy-MM-dd"
}

struct WeatherUnits {
    static let windUnits = "km/h"
}

enum WeatherType {
    case weather
    case forecast
}
