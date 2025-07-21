//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Xander The Boss on 7/20/25.
//

import Foundation

struct CurrentWeatherModel : Codable {
    
    //Current{} parameter of api call
    var observation_time : String
    var temperature : Float
    var weather_descriptions : [String]
    var wind_speed : Float
    var wind_dir : String
    var precip : Float
    var humidity : Float
    var cloudcover : Float
    var feelslike : Float
    var uv_index : Float
    var is_day : String
    var astro : Astro
}


struct Astro : Codable {

    var sunrise : String
    var sunset : String
}
