//
//  WeatherForecastViewModel.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

class WeatherForecastViewModel {
    
    var client = APIClient()
    
    var climateForecast: ClimateForecast?
    
    var lattitude: Double?
    var longitude: Double?
    
    var viewModelDidload: ViewModelDidload?
    
    let locationManager = LocationManager()
    
    var forecastRequest: GetClimateForecast?
    
    func configureViewModel() {
        locationManager.didUpdateLocation = {[weak self] location in
            self?.forecastRequest = GetClimateForecast(location?.latitude ?? 0, location?.longitude ?? 0)
            self?.getClimateDetails()
        }
    }
    
    func getClimateDetails() {
        guard let forecastRequest = forecastRequest else { return }
        client.performRequest(endpoint: forecastRequest) {[weak self] (response, error) in
            do {
                guard error == nil else {
                    self?.viewModelDidload?(nil, error)
                    return
                }
                self?.climateForecast = try response?.getModel() ?? ClimateForecast()
                self?.viewModelDidload?(self?.climateForecast, nil)
            }
            catch let exception {
                let error = APIError(code: 101, description: exception.localizedDescription)
                self?.viewModelDidload?(nil, error)
            }
        }
    }
    
    func convertClimateToDecodable() -> [[Climate]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.fullDate
        
        let dateString = climateForecast?.list?.first?.dt_txt?.components(separatedBy: " ").first ?? ""
        let date = dateFormatter.date(from: dateString) ?? Date()
        var datesArray = [String]()
        datesArray.append(dateString)
        for index in 1...4 {
            if let tomorrow = Calendar.current.date(byAdding: .day, value: index, to: date) {
                datesArray.append(dateFormatter.string(from: tomorrow))
            }
        }
        var arrayOfArray = [[Climate]]()
        for dateString in datesArray {
            let array = climateForecast?.list?.filter( { $0.dt_txt?.components(separatedBy: " ").first == dateString } )
            arrayOfArray.append(array ?? [])
        }
        return arrayOfArray
    }
}
