//
//  WeatherDetailsViewModelTests.swift
//  WeatherAppTests
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherDetailsViewModelTests: XCTestCase {
    
    var viewModel = WeatherDetailsViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecoding() throws {
        let _ = try JSONDecoder().decode(Climate.self, from: jsonData)
        XCTAssertTrue(true)
    }
    
    func testInitialization() {
        viewModel.countries = "UK,India,UAE"
        viewModel.viewModelDidload = { (result, error) in
            XCTAssertNotNil(result)
        }
        viewModel.getClimateDetails()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    private let jsonData = Data("""
    {
      "coord": {
        "lon": 55.3,
        "lat": 25.26
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "base": "stations",
      "main": {
        "temp": 306.42,
        "feels_like": 302.21,
        "temp_min": 303.71,
        "temp_max": 307.15,
        "pressure": 1011,
        "humidity": 20
      },
      "visibility": 6000,
      "wind": {
        "speed": 5.1,
        "deg": 220
      },
      "clouds": {
        "all": 28
      },
      "dt": 1585391291,
      "sys": {
        "type": 1,
        "id": 7537,
        "country": "AE",
        "sunrise": 1585361648,
        "sunset": 1585405994
      },
      "timezone": 14400,
      "id": 292223,
      "name": "Dubai",
      "cod": 200
    }
    """.utf8)
}
