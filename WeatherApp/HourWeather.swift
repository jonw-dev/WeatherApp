//
//  HourWeather.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import Foundation

struct HourWeather: Identifiable, Hashable {
    var id = UUID()
    var date: Date
    var temperature: Measurement<UnitTemperature>
    var condition: String
    var humidity: Double
    var windSpeed: Measurement<UnitSpeed>

    // Manual conformance to Hashable (optional if all properties are Hashable)
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(date)
        hasher.combine(temperature)
        hasher.combine(condition)
        hasher.combine(humidity)
        hasher.combine(windSpeed)
    }

    // Equatable conformance
    static func == (lhs: HourWeather, rhs: HourWeather) -> Bool {
        return lhs.id == rhs.id &&
               lhs.date == rhs.date &&
               lhs.temperature == rhs.temperature &&
               lhs.condition == rhs.condition &&
               lhs.humidity == rhs.humidity &&
               lhs.windSpeed == rhs.windSpeed
    }
}



