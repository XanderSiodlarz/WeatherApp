//
//  ContentView.swift
//  WeatherApp
//
//  Created by Xander The Boss on 7/19/25.
//

import SwiftUI

struct ContentView: View {
    
    let majorUSCities : [String] = [
        "New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose"
    ]
    @State var selectedCity = "New York"
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Top 10 Most Populated U.S. Cities:")

                Picker("Select a City", selection: $selectedCity) {
                    ForEach(majorUSCities, id: \.self) { city in
                        Text(city).tag(city)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .font(.title)
                Spacer()
                Spacer()
                NavigationLink(destination: WeatherDetailView(cityName: selectedCity)) {
                    Text("Find City's Weather")
                        .font(.headline)
                        
                }
                
            }
            .navigationTitle("Pick a City in the U.S.")
            .padding(.vertical)
        }
    }
}

#Preview {
    ContentView()
}
