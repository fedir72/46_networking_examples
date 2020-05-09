//
//  WeatherDataModel.swift
//  networkingExamples
//
//  Created by fedir on 02.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
struct Main: Codable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
    }

struct WeatherData: Codable  {
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}


//var cc = {"coord": { "lon": 139,"lat": 35},
//  "weather": [
//    {
//      "id": 800,
//      "main": "Clear",
//      "description": "clear sky",
//      "icon": "01n"
//    }
//  ],
//  "base": "stations",
//  "main": {
//    "temp": 281.52,
//    "feels_like": 278.99,
//    "temp_min": 280.15,
//    "temp_max": 283.71,
//    "pressure": 1016,
//    "humidity": 93
//  },
//  "wind": {
//    "speed": 0.47,
//    "deg": 107.538
//  },
//  "clouds": {
//    "all": 2
//  },
//  "dt": 1560350192,
//  "sys": {
//    "type": 3,
//    "id": 2019346,
//    "message": 0.0065,
//    "country": "JP",
//    "sunrise": 1560281377,
//    "sunset": 1560333478
//  },
//  "timezone": 32400,
//  "id": 1851632,
//  "name": "Shuzenji",
//  "cod": 200
//}
