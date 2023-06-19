//
//  weatherInfo.swift
//  weatbherApp
//
//  Created by Arti Karnik on 6/18/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit

struct WeatherInfo{
    var cityName: String
    var icon: String
    var temp: String
    var dt: String
    var wind: String
    var maxTemp: String
    var minTemp: String
    var humidity: String
    var description: String
    
    init(cityName: String, icon: String, temp: String, dt: String, wind: String, maxTemp: String, minTemp: String, humidity: String, description: String) {
        self.cityName = cityName
        self.icon = icon
        self.temp = temp
        self.dt = dt
        self.description = description
        self.wind = wind
        self.humidity = humidity
        self.maxTemp = maxTemp
        self.minTemp = minTemp
        self.wind = wind
    }
}

struct WeatherForecast{
    var temp: String
    var dt: String
    var icon: String

    init(temp: String, dt: String, icon: String) {
        self.temp = temp
        self.dt = dt
        self.icon = icon
    }
}
