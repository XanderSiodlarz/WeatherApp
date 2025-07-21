//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Xander The Boss on 7/19/25.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    @StateObject var weathers = WeatherViewModel()
    @AppStorage("hasSeenIntro") var hasSeenIntro: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasSeenIntro {
                ContentView()
                    .environmentObject(weathers)
            } else {
                IntroView {
                    hasSeenIntro = true
                }
                    .environmentObject(weathers)
            }
            
        }
    }
}
