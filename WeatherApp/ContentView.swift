//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI
import WeatherKit

struct ContentView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            WeatherConditionBackgroundView(condition: viewModel.weatherConditionBackground)
                .ignoresSafeArea()
            
            VStack {
                // Symbol and text for location and current temperature
                VStack {
                    Image(systemName: sfSymbol(for: viewModel.weatherConditionBackground))
                        .font(.largeTitle)
                        .foregroundColor(color(for: viewModel.weatherConditionBackground))
                        .padding(.top, 50)
                    
                    Text(viewModel.locationName)
                        .font(.largeTitle)
                        .padding()
                    
                    if let currentWeather = viewModel.currentWeather {
                        Text(currentWeather.temperature.formatted())
                            .font(.title)
                    } else {
                        Text("Loading weather data...")
                            .font(.title)
                    }
                }
                
                Spacer()
                
                // Hourly forecast
                if !viewModel.hourlyForecast.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(filteredHourlyForecast(), id: \.date) { hourWeather in
                                VStack {
                                    Image(systemName: sfSymbol(for: WeatherCondition.fromWeatherKit(hourWeather.condition)))
                                        .font(.largeTitle)
                                        .foregroundColor(color(for: WeatherCondition.fromWeatherKit(hourWeather.condition)))
                                    Text(hourWeather.date, style: .time)
                                        .font(.caption)
                                    Text(hourWeather.temperature.formatted())
                                        .font(.caption)
                                }
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                
                // Daily forecast
                if !viewModel.dailyForecast.isEmpty {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.dailyForecast.prefix(10), id: \.date) { dayWeather in
                                HStack {
                                    Image(systemName: sfSymbol(for: WeatherCondition.fromWeatherKit(dayWeather.condition)))
                                        .font(.title)
                                        .foregroundColor(color(for: WeatherCondition.fromWeatherKit(dayWeather.condition)))
                                    Text(dayWeather.date, style: .date)
                                        .font(.caption)
                                    Spacer()
                                    Text("High: \(dayWeather.highTemperature.formatted())")
                                        .font(.caption)
                                    Text("Low: \(dayWeather.lowTemperature.formatted())")
                                        .font(.caption)
                                }
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.requestLocation()
        }
    }
    
    // Method to filter hourly forecast for the remainder of the current day
    private func filteredHourlyForecast() -> [WeatherKit.HourWeather] {
        let now = Date()
        let calendar = Calendar.current
        let midnight = calendar.startOfDay(for: now).addingTimeInterval(24*60*60)
        
        return viewModel.hourlyForecast.filter { $0.date >= now && $0.date < midnight }
    }
    // Method to get SF symbol for weather condition for WeatherApp.WeatherCondition
    
    private func sfSymbol(for condition: WeatherCondition) -> String {
        switch condition {
        case .mostlyClear:
            return "cloud.sun"
        case .clear:
            return "sun.max"
        case .cloudy:
            return "cloud.fill"
        case .rain:
            return "cloud.rain.fill"
        case .haze:
            return "cloud.fog.fill"
        case .thunderstorms:
            return "cloud.bolt.fill"
        case .partlyCloudy:
            return "cloud.sun.fill"
        case .snow:
            return "cloud.snow.fill"
        case .drizzle:
            return "cloud.drizzle.fill"
        case .hail:
            return "cloud.hail.fill"
        case .sleet:
            return "cloud.sleet.fill"
        case .flurries:
            return "wind.snow"
        case .freezingRain:
            return "cloud.sleet.fill"
        case .blizzard:
            return "wind.snow"
        case .smoky:
            return "smoke.fill"
        case .blowingDust:
            return "sun.dust.fill"
        case .scatteredThunderstorms:
            return "cloud.hail.fill"
        case .hurricane:
            return "hurricane"
        case .windy:
            return "wind"
        case .mostlyCloudy:
            return "cloud"
        default:
            return "questionmark.circle.fill"
        }
    }

    // Method to get color for weather condition for WeatherApp.WeatherCondition
    private func color(for condition: WeatherCondition) -> Color {
        switch condition {
        case .mostlyClear:
            return .white
        case .clear:
            return .yellow
        case .cloudy:
            return .gray
        case .rain:
            return .blue
        case .haze:
            return .white
        case .thunderstorms:
            return .purple
        case .partlyCloudy:
            return .orange
        case .snow:
            return .white
        case .drizzle:
            return .blue
        case .hail:
            return .gray
        case .sleet:
            return .gray
        case .flurries:
            return .white
        case .freezingRain:
            return .gray
        case .blizzard:
            return .white
        case .smoky:
            return .gray
        case .blowingDust:
            return .yellow
        case .thunderstorms:
            return .gray
        case .hurricane:
            return .blue
        case .windy:
            return .black
        case .mostlyCloudy:
            return .black
        default:
            return .black
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WeatherViewModel())
    }
}





