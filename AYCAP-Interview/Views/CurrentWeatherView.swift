//
//  CurrentWeatherView.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 4/6/2565 BE.
//

import SwiftUI
import SDWebImageSwiftUI

struct CurrentWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("\(cityVM.city)")
                .font(.largeTitle)
                .bold()
            
            Text("Currently")
            
            Text("\(cityVM.conditions)")
                .font(.title)
            
            WebImage(url: URL(string: "\(cityVM.getIconFor(icon: cityVM.weatherIcon))")!)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            
            
            
            HStack {
                Text("\(cityVM.temperature)")
                    .font(.custom("SF Pro", size: 50))
                    .bold()
                
                switch cityVM.unit {
                case "imperial":
                    Text("°F")
                        .font(.custom("SF Pro", size: 50))
                        .bold()
                    
                default:
                    Text("°C")
                        .font(.custom("SF Pro", size: 50))
                        .bold()
                }
            }
            
            HStack(spacing: 10) {
                Text("Humidity")
                    .font(.body)
                Text("\(cityVM.humidity)")
            }
        }
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
