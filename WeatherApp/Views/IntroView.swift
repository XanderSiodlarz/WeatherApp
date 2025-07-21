//
//  IntroView.swift
//  WeatherApp
//
//  Created by Xander The Boss on 7/20/25.
//

import SwiftUI

struct IntroView: View {
    
    @EnvironmentObject var weathers : WeatherViewModel
    var onFinish : () -> Void = { }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Find Weather in Your Area Today!")
                .font(.title)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                onFinish()
            }) {
                Text("Find Out")
                    .font(.title3)
                    .bold()
            }
        }
        .background(
            Image("weather")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    IntroView()
}
