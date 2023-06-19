//
//  Location.swift
//  weatherApp
//
//  Created by Arti Karnik on 6/18/23.
//  Copyright © 2023 Arti Karnik. All rights reserved.
//

import Foundation

struct Location: Codable {
    let lat: Double?
    let lon: Double?
}

struct Current: Codable {
    let weather: [Weather]
    let wind: Wind
    let main: Main
    let dt: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct forecast: Codable {
    let list: [List]
}

struct List: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
}
struct Wind: Codable {
    let speed: Double
}
