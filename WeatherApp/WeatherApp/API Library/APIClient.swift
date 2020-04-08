//
//  APIClient.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/6/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation

class APIClient {
    
    private var urlSession: URLSession {
        return URLSession.shared
    }
    
    private func perform(endpoint: APIEndpoint, _ completionBlock:((_ data: Data?, _ response: URLResponse? , _ error: Error?) -> Void)?) {
        guard let url = URL(string: endpoint.url) else {
            completionBlock?(nil, nil, NSError(domain: "-111", code: -111, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: 60.0)
        request.httpMethod = endpoint.httpMethod.rawValue
        let task = urlSession.dataTask(with: request) {data, response, error in
            completionBlock?(data, response, error)
        }
        task.resume()
    }
    
    func performRequest(endpoint: APIEndpoint, _ completionBlock:((_ result: APIResponse?, _ error: APIError?) -> Void)?) {
        self.perform(endpoint: endpoint) { [weak self] (data, serverResponse, error) in
            let serverResponse = serverResponse as? HTTPURLResponse
            self?.parseResponse(data: data, response: serverResponse, error: error, { (dnResponse, apiError) in
                DispatchQueue.main.async {
                    completionBlock?(dnResponse, apiError)
                }
            })
        }
    }
    
    func parseResponse(data:Data?, response:HTTPURLResponse?, error:Error?, _ completion:((_ result: APIResponse?, _ error: APIError?) -> Void)?) {
        if let err = error {
            let error = APIError(code: 100, description: err.localizedDescription)
            completion?(nil, error)
        } else if let rData = data {
            if let serverResponse = response {
                var dnResponse = APIResponse(data: rData)
                dnResponse.statusCode = serverResponse.statusCode
                DispatchQueue.main.async {
                    completion?(dnResponse, nil)
                }
            }
        }
    }
}
