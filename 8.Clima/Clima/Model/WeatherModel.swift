//
//  WeatherModel.swift
//  Clima
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 22/09/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
//import CoreLocation

 struct WeatherModel
 {
    let conditionId: Int
    let cityName: String
    let latitude: Double
    let longitud: Double
    let temperature: Double
    
    var temperatureString: String{
        return String(format:"%.1f", temperature)
    }
    var conditionName: String{
            switch conditionId {
            case 200..<233:
                return "cloud.bolt.rain"
            case 300..<322:
                return "cloud.drizzle"
            case 500..<505:
                return "cloud.heavyrain"
            case 511 :
                return "snow"
            case 520..<532:
                return "cloud.bolt.rain"
            case 600..<623:
                return "snow"
            case 700..<800:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801..<805:
                return "cloud"
            default:
                return ""
            }
        }
    }
    
