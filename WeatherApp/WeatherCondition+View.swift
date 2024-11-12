//
//  WeatherCondition+View.swift
//  WeatherApp
//
//  Created by Jon Williams on 08/11/2024.
//

import SwiftUI

extension WeatherCondition {
    @ViewBuilder
    func toView() -> some View {
        switch self {
        case .mostlyClear:
            ClearSkyView()
        case .clear:
            ClearSkyView()
        case .cloudy:
            CloudyBackgroundView()
        case .rain:
            RainyView()
        case .haze:
            FoggyBackgroundView()
        case .thunderstorms:
            StormyBackgroundView()
        case .unknown:
            ClearSkyView()
        case .partlyCloudy:
            CloudView()
        case .snow:
            ClearSkyView()
        case .drizzle:
            ClearSkyView()
        case .hail:
            ClearSkyView()
        case .sleet:
            ClearSkyView()
        case .flurries:
            ClearSkyView()
        case .freezingRain:
            ClearSkyView()
        case .blizzard:
            ClearSkyView()
        case .smoky:
            ClearSkyView()
        case .blowingDust:
            ClearSkyView()
        case .scatteredThunderstorms:
            ClearSkyView()
        case .hurricane:
            ClearSkyView()
        case .windy:
            WindView()
        case .mostlyCloudy:
            RainingCatsAndDogsView()
        case .thunderstorms:
            ClearSkyView()
        }
    }
}

