//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Xander The Boss on 7/20/25.
//

import Foundation

class WeatherViewModel : ObservableObject {
    
    @Published var weather: WeatherAPIResponse? = nil
    @Published var isLoading = false
    @Published var hasError = false
    @Published var weatherError : WeatherModelError?
    
    @MainActor
    func fetchWeatherData(cityName : String) async {
        self.isLoading = true
        
        let baseUrl = "https://api.weatherstack.com/current"
        
        let api = "398b97020a5838a814d9cf8c5e08aa40"
        
        guard var components = URLComponents(string : baseUrl) else { return }
        components.queryItems = [
            URLQueryItem(name: "access_key", value: api),
            URLQueryItem(name: "query", value: cityName)
        ]
        
        guard let url = components.url else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(WeatherAPIResponse.self, from: data)
            self.isLoading = false
            self.weather = response
        }
        catch {
            self.hasError = true
            self.weatherError = .customError(error: error)
            self.isLoading = false
        }
    }
                
    struct WeatherAPIResponse : Codable {
        let current : CurrentWeatherModel
        let location : LocationModel
    }

    
    enum WeatherModelError : LocalizedError {
        case decodingError
        case customError(error: Error)
        
        var errrorDescription: String? {
            switch self {
            case .decodingError:
                return "Error decoding JSON"
            case .customError(error: let error):
                return error.localizedDescription
            }
        }
    }
}
