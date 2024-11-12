//
//  WeatherCondition+Extensions.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import WeatherKit

extension WeatherCondition {
    static func fromWeatherKit(_ weatherKitCondition: WeatherKit.WeatherCondition) -> WeatherCondition {
        switch weatherKitCondition {
        case .clear:
            return .clear
        case .cloudy:
            return .cloudy
        case .rain:
            return .rain
        case .haze: // Assuming 'fog' maps to 'haze' in your custom condition
            return .haze
        case .thunderstorms:
            return .thunderstorms
        case .partlyCloudy:
            return .partlyCloudy
        case .snow:
            return .snow
        case .drizzle:
            return .drizzle
        case .hail:
            return .hail
        case .sleet:
            return .sleet
        case .flurries:
            return .flurries
        case .freezingRain:
            return .freezingRain
        case .blizzard:
            return .blizzard
        case .smoky:
            return .smoky
        case .blowingDust:
            return .blowingDust
        case .scatteredThunderstorms:
            return .scatteredThunderstorms
        case .hurricane:
            return .hurricane
        case .windy:
            return .windy
        case .mostlyCloudy:
            return .mostlyCloudy
        case .tropicalStorm:
            return .thunderstorms
        default:
            return .unknown // Handle any other conditions with a default case
        }
    }
}




