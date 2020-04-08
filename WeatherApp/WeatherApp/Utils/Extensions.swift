//
//  Extensions.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(_ title: String?, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension String {
    func calculateDate(_ dateFormatter: DateFormatter) -> String {
        return calculateDateTime(dateFormatter).components(separatedBy: " ").first ?? ""
    }
    
    func calculateTime(_ dateFormatter: DateFormatter, _ is24Hours: Bool = false) -> String {
        if is24Hours {
            return calculateDateTime(dateFormatter).components(separatedBy: " ").last ?? ""
        } else {
            let dateString = self.components(separatedBy: " ").last ?? ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let date = dateFormatter.date(from: dateString) ?? Date()
            dateFormatter.dateFormat = "hh:mm a"
            let dateInTime = dateFormatter.string(from: date)
            
            return dateInTime
        }
    }
    
    func calculateDateTime(_ dateFormatter: DateFormatter) -> String {
        let dateValue = dateFormatter.date(from: self) ?? Date()
        return dateFormatter.string(from: dateValue)
    }
}

extension Double {
    func asString() -> String {
        return String(format:"%.2f", self)
    }
    
    func asDegrees() -> String {
        let degrees = self - 273.15
        return String(format: "%.0f°", degrees)
    }
}

extension UIButton {
    func disableForWhile(_ duration: TimeInterval = 1.2) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.7
            self.isUserInteractionEnabled = false
        }) { (finished) in
            self.alpha = 1
            self.isUserInteractionEnabled = true
        }
    }
}
