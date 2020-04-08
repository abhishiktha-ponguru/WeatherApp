//
//  WeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

typealias ViewModelDidload = ((_ results: Any?, _ error: APIError?) -> Void)

class WeatherDetailsViewModel {
    
    var client = APIClient()
    
    var climate: Climate?
    var countries: String?
    
    var viewModelDidload: ViewModelDidload?
    
    func getClimateDetails() {
        let climateRequest = GetClimateDetails(countries ?? "")
        client.performRequest(endpoint: climateRequest) {[weak self] (response, error) in
            do {
                guard error == nil else {
                    self?.viewModelDidload?(nil, error)
                    return
                }
                self?.climate = try response?.getModel() ?? Climate()
                self?.viewModelDidload?(self?.climate, nil)
            }
            catch let exception {
                let error = APIError(code: 101, description: exception.localizedDescription)
                self?.viewModelDidload?(nil, error)
            }
        }
    }
    
    func convertTextToDecodable() -> [[Climate]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.fullDate
        
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        var datesArray = [String]()
        datesArray.append(dateString)
        var arrayOfArray = [[Climate]]()
        arrayOfArray.append([(climate ?? Climate())])
        return arrayOfArray
    }
}
