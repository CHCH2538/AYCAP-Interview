//
//  SwiftUIView.swift
//  AYCAP-Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 4/6/2565 BE.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "Bangkok"
    
    @State private var unit = "metric"
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("", text: $searchTerm)
                    .padding(.leading, 10)
                Button {
                    cityVM.city = searchTerm
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                        Image(systemName: "magnifyingglass")
                    }
                }
                .frame(width: 50, height: 30)
            }
            .foregroundColor(.white)
            .padding()
            .background(ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.blue.opacity(0.6))
            })
            
            HStack {
                Button {
                    cityVM.unit = "metric"
                } label: {
                    Text ("°C")
                }
                
                Button {
                    cityVM.unit = "imperial"
                } label: {
                    Text ("°F")
                }
            }
            .buttonStyle(.bordered)
        }
        
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
