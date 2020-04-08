//
//  Reachability.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation
import SystemConfiguration

public class Reachability {
    
    open class var isConnectedToNetwork: Bool {
        get {
            var emptyAddress = sockaddr_in()
            emptyAddress.sin_len = UInt8(MemoryLayout.size(ofValue: emptyAddress))
            emptyAddress.sin_family = sa_family_t(AF_INET)
            
            guard let defaultRouteReachability: SCNetworkReachability = withUnsafePointer(to: &emptyAddress, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(nil, $0)
                }
            }), var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags() as SCNetworkReachabilityFlags?, SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) else { return false }
            return flags.contains(.reachable) && !flags.contains(.connectionRequired)
        }
    }
}
