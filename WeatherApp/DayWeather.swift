//
//  DayWeather.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import Foundation

struct DayWeather: Identifiable, Hashable {
    var id = UUID()
    var date: Date
    var highTemperature: Measurement<UnitTemperature>
    var lowTemperature: Measurement<UnitTemperature>
    // Add other properties as needed

    // Manual conformance to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(date)
        hasher.combine(highTemperature)
        hasher.combine(lowTemperature)
    }

    // Equatable conformance
    static func == (lhs: DayWeather, rhs: DayWeather) -> Bool {
        return lhs.id == rhs.id &&
               lhs.date == rhs.date &&
               lhs.highTemperature == rhs.highTemperature &&
               lhs.lowTemperature == rhs.lowTemperature
    }
}



