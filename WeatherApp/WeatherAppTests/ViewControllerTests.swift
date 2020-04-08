//
//  ViewControllerTests.swift
//  WeatherAppTests
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import XCTest
@testable import WeatherApp

class ViewControllerTests: XCTestCase {
    
    var controller = ViewController()
    let viewModel = WeatherDetailsViewModel()
    
    func testProcessTransactionRequest(){
        
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controller.configureViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        _ = controller.validateTextFiled()
    }
    
    func testExtension() {
        controller.showAlert("title", "Message")
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.fullDateTime
        let dateString = dateFormatter.string(from: date)
        let timeString = dateString.calculateDate(dateFormatter)
        let dateTimetring = dateString.calculateTime(dateFormatter)
        XCTAssertNotNil(timeString)
        XCTAssertNotNil(dateTimetring)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
