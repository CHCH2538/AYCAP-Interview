//
//  DailyWeatherView.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 4/6/2565 BE.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 1) {
                Text("\(cityVM.city)")
                    .font(.largeTitle)
                    .bold()
                
                ForEach(cityVM.weather.daily.prefix(5)) { weather in
                    dailyCell(weather: weather)
                }
            }
        }
        .padding(.top, 10)
    }
   
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
            
            Spacer()
            
            Text("High \(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min)) Low")
            
            switch cityVM.unit {
            case "imperial":
                Text("°F")
                    .font(.custom("SF Pro", size: 17))
                    .bold()
                
            default:
                Text("°C")
                    .font(.custom("SF Pro", size: 17))
                    .bold()
            }
        }
        .foregroundColor(.black)
        .padding()
        .background(RoundedRectangle(cornerRadius: 0).fill(Color.white))
    }
}


struct TodayForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
