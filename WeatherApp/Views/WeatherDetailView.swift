//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Xander The Boss on 7/20/25.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @EnvironmentObject var weathers : WeatherViewModel
    var cityName : String
    var body: some View {
        ScrollView {
            if weathers.isLoading {
                ProgressView("Loading Data...")
                    .padding()
            }
            else {
                VStack {
                    if let location = weathers.weather?.location {
                        VStack {
                            Text("Place: \(location.name)")
                            Text("Coordinates: Longitude: \(location.lon)  | Latitude: \(location.lat)")
                            Text("Timezone: \(location.timezone_id)")
                        }
                        .multilineTextAlignment(.leading)
                    } else {
                        Text("No current data available for city")
                    }
                    if let curr = weathers.weather?.current {
                        VStack {
                            HStack {
                                Text("Temp: \(curr.temperature) C")
                                Text("Feels like: \(curr.feelslike) C")
                            }
                            .padding()
                            HStack {
                                Text("Sunrise: \(curr.astro.sunrise)")
                                Text("Sunset: \(curr.astro.sunset)")
                            }
                            HStack {
                                Text(curr.observation_time)
                                if curr.is_day == "no" {
                                    Text("Daytime")
                                }
                                else {
                                    Text("Night")
                                }
                            }
                            .padding()
                            HStack {
                                Text("Wind: ")
                                Text("\(curr.wind_speed)m/s")
                                Text("\(curr.wind_dir)")
                            }
                            .padding()
                            Text("Precipitation: \(curr.precip) mm")
                                .padding()
                            Text("Humidity: \(curr.humidity)")
                                .padding()
                            HStack {
                                Text("UV: \(curr.uv_index)")
                                Text("Cloud Coverage: \(curr.cloudcover)%")
                            }
                            .padding()
                            VStack{
                                Text("Descriptors")
                                    .underline()
                                ForEach(curr.weather_descriptions, id: \.self) { desc in
                                    Text(desc)
                                }
                            }
                            .padding()
                            
                        }
                    }
                    else {
                        Text("No Current Weather Available")
                    }
                }
            }
        }
        .task {
            await weathers.fetchWeatherData(cityName: cityName)
            
            
        }
    }
    
}

//#Preview {
//    WeatherDetailView()
//}
