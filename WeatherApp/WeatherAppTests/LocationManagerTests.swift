//
//  LocationManagerTests.swift
//  WeatherAppTests
//
//  Created by Ashok on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import XCTest
@testable import WeatherApp

class LocationManagerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReachabilitySuccess() {
        XCTAssertEqual(Reachability.isConnectedToNetwork, true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitialization() {
        let locationManager = LocationManager()
        locationManager.requestPermission()
    }
}
