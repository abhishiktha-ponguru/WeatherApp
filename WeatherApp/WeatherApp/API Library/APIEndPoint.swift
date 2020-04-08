//
//  APIEndPoint.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/7/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

/*case 1
 //http://api.openweathermap.org/data/2.5/weather?appid=331fc0c7b422365e594b67341c728c82&q=London,uk
 
 case 2
 //http://api.openweathermap.org/data/2.5/forecast?appid=331fc0c7b422365e594b67341c728c82&lat=35&lon=139
 */

import Foundation

struct API {
    static let baseUrl = "http://api.openweathermap.org/"
    static let version = "data/2.5/"
    static let weatherPath = "weather"
    static let forecastPath = "forecast"
    static let appIdKey = "appid"
    static let appId = "331fc0c7b422365e594b67341c728c82"
}

class APIEndpoint {
    
    var baseUrl: String {
        return API.baseUrl
    }
    
    var path: String {
        return ""
    }
    
    var params: String {
        return ""
    }
    
    var appid: String {
        return "?\(API.appIdKey)=\(API.appId)"
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var apiVersion: String {
        return API.version
    }
    
    var url : String {
        return baseUrl + apiVersion + path + appid + params
    }
}

enum HttpMethod :String {
    case post = "POST"
    case get = "GET"
}
