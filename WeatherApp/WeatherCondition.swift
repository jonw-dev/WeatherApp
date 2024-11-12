//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Jon Williams on 08/11/2024.
//

enum WeatherCondition: String {
    case mostlyClear = "MostlyClear"
    case clear = "Clear"
    case cloudy = "Cloudy"
    case rain = "Rain"
    case haze = "Haze"
    case thunderstorms = "Thunderstorms"
    case partlyCloudy = "Partly Cloudy"
    case mostlyCloudy = "Mostly Cloudy"
    case snow = "Snow"
    case drizzle = "Drizzle"
    case hail = "Hail"
    case sleet = "Sleet"
    case flurries = "Flurries"
    case freezingRain = "Freezing Rain"
    case blizzard = "Blizzard"
    case smoky = "Smoky"
    case blowingDust = "Blowing Dust"
    case scatteredThunderstorms = "Scattered Thunderstorms"
    case hurricane = "Hurricane"
    case windy = "Windy"
    case unknown = "Unknown"
    
    static func fromWeatherKit(_ condition: String) -> WeatherCondition {
        return WeatherCondition(rawValue: condition) ?? .unknown
    }
}


