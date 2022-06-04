//
//  ContentView.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 3/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM = CityViewViewModel()
    
    @State var showDailyWeather = false
    
    var body: some View {
        NavigationView {
    
            ScrollView {
                VStack(spacing: 70) {
                    SearchBarView(cityVM: cityVM)
                    
                    CurrentWeatherView(cityVM: cityVM)
                }
                .padding(.top, 20)
                
                .navigationTitle("Current Weather")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                                  Button {
                                    showDailyWeather = true
                                  } label: {
                                      Text("5 Days Forecast")
                                  }
                                  .sheet(isPresented: $showDailyWeather) {
                                      DailyWeatherView(cityVM: cityVM)
                                  }
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
