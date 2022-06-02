//
//  APIExtension.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 3/6/2565 BE.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, lon: Double, units: String) -> String {
        
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=\(units)"
    }
}
