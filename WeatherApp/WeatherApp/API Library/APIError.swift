//
//  APIError.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/7/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

struct APIError {
    var code: Int?
    var description: String?
}

struct ErrorMessage {
    static let internetError = "Please check your Internet connection"
    static let noDataError = "Data Received empty from the server please try again"
    static let locationDisabled = "You current location is unavailable please change the permissions under settings"
}
