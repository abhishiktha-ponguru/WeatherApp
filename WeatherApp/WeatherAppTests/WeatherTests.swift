//
//  WeatherTests.swift
//  WeatherAppTests
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherTests: XCTestCase {
    
    var climateForecast = ClimateForecast()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
            climateForecast = try JSONDecoder().decode(ClimateForecast.self, from: jsonData)
        }
        catch { }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDecoding() throws {
        let climate = ClimateForecast(list: climateForecast.list)
        XCTAssertNil(climate.list?.first?.minTemperature)
        let button = UIButton()
        button.disableForWhile()
    }
    
    private let jsonData = Data("""
       {
         "cod": "200",
         "message": 0,
         "cnt": 40,
         "list": [
           {
             "dt": 1585159200,
             "main": {
               "temp": 294.54,
               "feels_like": 293.95,
               "temp_min": 294.48,
               "temp_max": 294.54,
               "pressure": 1012,
               "sea_level": 1012,
               "grnd_level": 1011,
               "humidity": 61,
               "temp_kf": 0.06
             },
             "weather": [
               {
                 "id": 802,
                 "main": "Clouds",
                 "description": "scattered clouds",
                 "icon": "03n"
               }
             ],
             "clouds": {
               "all": 26
             },
             "wind": {
               "speed": 2.43,
               "deg": 305
             },
             "sys": {
               "pod": "n"
             },
             "dt_txt": "2020-03-25 18:00:00"
           }
         ],
         "city": {
           "id": 292223,
           "name": "Dubai",
           "coord": {
             "lat": 25.2582,
             "lon": 55.3047
           },
           "country": "AE",
           "population": 1137347,
           "timezone": 14400,
           "sunrise": 1585102637,
           "sunset": 1585146716
         }
       }
       """.utf8)
}
