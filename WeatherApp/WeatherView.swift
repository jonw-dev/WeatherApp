//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI
import WeatherKit

struct WeatherView: View {
    let weather: Weather

    private let temperatureFont: Font = .largeTitle
    private let conditionFont: Font = .title
    private let fontColor: Color = .white
    private let verticalSpacing: CGFloat = 20
    
    var body: some View {
        VStack(spacing: verticalSpacing) {
            Text("Temperature: \(Int(weather.currentWeather.temperature.value))°")
                .font(temperatureFont)
                .foregroundColor(fontColor)
            Text(weather.currentWeather.condition.description.capitalized)
                .font(conditionFont)
                .foregroundColor(fontColor)
        }
    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView(weather: Weather.mock) // Assuming you have a mock data for preview
//    }
//}

