//
//  DailyWeather.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 3/6/2565 BE.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "Clear", description: "Clear Skies", icon: "01d")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
