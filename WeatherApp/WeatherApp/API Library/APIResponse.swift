//
//  APIResponse.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/7/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

struct APIResponse {
    
    let data: Data
    var statusCode:Int = -100
    
    init(data: Data) {
        self.data = data
    }
    
    func getModel<T:Codable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self.data)
    }
}
