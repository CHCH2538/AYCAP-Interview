//
//  ContentView.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 3/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing:  0) {
                SearchBarView(cityVM: cityVM)
                
                TabView {
                    CurrentWeatherView(cityVM: cityVM)
                        .tabItem{
                            Image(systemName: "sun.max")
                            Text("Current")
                        }
                    DailyWeatherView(cityVM: cityVM)
                        .tabItem{
                            Image(systemName: "eyeglasses")
                            Text("Daily Forcast")
                        }
                        
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
