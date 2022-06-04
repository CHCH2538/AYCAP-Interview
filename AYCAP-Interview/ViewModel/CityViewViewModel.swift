//
//  CityViewViewModel.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 4/6/2565 BE.
//

import Foundation

import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Bangkok" {
        didSet {
            getLocation()
        }
    }
    @Published var unit = "metric" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var humidity: String {
        return getHumidityFor(humidity: weather.current.humidity)
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getHumidityFor(humidity: Int) -> String {
        return String(format: "%d%%", humidity)
    }
    
    func getIconFor(icon: String) -> String {
        return "http://openweathermap.org/img/w/\(icon).png"
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude, units: unit)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = API.getURLFor(lat: 13.736717, lon: 100.523186, units: unit)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
                
            case .failure(let err):
                print (err)
            }
        }
    }
}
