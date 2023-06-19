//
//  baseURL.swift
//  weatherApp
//
//  Created by Arti Karnik on 6/18/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import UIKit
import Foundation

let geocodeURL = "https://api.openweathermap.org/geo/1.0/direct?"
let cityURL = "https://api.openweathermap.org/data/2.5/weather?"
let apiKey = "7eb54377ff42e66b921705267bf82b96"
let cityName = ""
let forecastURL = "https://api.openweathermap.org/data/2.5/forecast?"
let weatherIconURL = "https://openweathermap.org/img/wn/"
let Ext_apiKeyURL = "&appid="
let Ext_unitsURL = "&units=metric"
let Ext_LonURL = "&lon="

struct weather {
    
    func buildGeocodeURL(_cityName: String) -> String {
        let url  = geocodeURL + "q=" + _cityName + "&limit=5" + Ext_apiKeyURL + apiKey + Ext_unitsURL
        return url
    }
    
    func buildCityURL(lat: String, lon: String) -> String {
        let url = cityURL + "lat=" + lat + Ext_LonURL + lon + Ext_apiKeyURL + apiKey + Ext_unitsURL
        return url
    }
    
    func buildForecastURL(lat: String, lon: String) -> String {
        let url = forecastURL + "lat=" + lat + Ext_LonURL + lon + Ext_apiKeyURL  + apiKey + Ext_unitsURL +  "&cnt=40"
        return url
    }
    
    
}
