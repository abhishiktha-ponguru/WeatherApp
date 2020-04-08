//
//  WeatherAPIRequest.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/6/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

class GetClimateDetails: APIEndpoint {
    
    var countriesString: String?
    
    override var path: String {
        return API.weatherPath
    }
    
    override var params: String {
        return "&q=\(countriesString ?? "")"
    }
    
    init(_ countryString: String) {
        self.countriesString = countryString
    }
}

class GetClimateForecast: APIEndpoint {
    
    var latitude: Double?
    var longitude: Double?
    
    override var path: String {
        return API.forecastPath
    }
    
    override var params: String {
        return "&lat=\(latitude ?? 0)&lon=\(longitude ?? 0)"
    }
    
    init(_ latitude: Double, _ longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
