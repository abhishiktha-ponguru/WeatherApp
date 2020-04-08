//
//  WeatherForecastViewModelTests.swift
//  WeatherAppTests
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherForecastViewModelTests: XCTestCase {
    
    var viewModel = WeatherForecastViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testInitialization() {
        viewModel.lattitude = 23.3445
        viewModel.longitude = 12.3445
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
}
