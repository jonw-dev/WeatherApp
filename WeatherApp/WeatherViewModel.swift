//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//


import SwiftUI
import CoreLocation
import WeatherKit
import Combine

class WeatherViewModel: NSObject, ObservableObject {
    // Services
    private let weatherService = WeatherService.shared
    private let locationManager = CLLocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    // Published properties
    @Published var currentWeather: CurrentWeather?
    @Published var dailyForecast: [WeatherKit.DayWeather] = []
    @Published var hourlyForecast: [WeatherKit.HourWeather] = []
    @Published var locationName: String = "Loading location..."
    @Published var weatherConditionBackground: WeatherCondition = .clear
    @Published var favoriteLocations: [String] = []

    // Constants
    private let locationAuthorizationStatus = "Unknown Location"
    private let favoritesKey = "FavoriteLocations"
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        loadFavorites()
    }

    func fetchWeather(for location: CLLocation) {
        Task {
            do {
                let weather = try await weatherService.weather(for: location)
                DispatchQueue.main.async {
                    self.currentWeather = weather.currentWeather
                    self.dailyForecast = weather.dailyForecast.forecast
                    self.hourlyForecast = weather.hourlyForecast.forecast
                    self.updateBackground(for: weather.currentWeather.condition)
                    print(weather.currentWeather)
                }
            } catch {
                print("Error fetching weather: \(error)")
                
            }
        }
    }

    private func updateBackground(for condition: WeatherKit.WeatherCondition) {
        self.weatherConditionBackground = WeatherCondition.fromWeatherKit(condition)
    }

    func fetchLocationName(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                self.locationName = placemark.locality ?? self.locationAuthorizationStatus
            } else if let error = error {
                print("Geocoding error: \(error)")
            }
        }
    }

    func requestLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

    func addFavorite(_ locationName: String) {
        favoriteLocations.append(locationName)
        saveFavorites()
    }

    func saveFavorites() {
        UserDefaults.standard.set(favoriteLocations, forKey: favoritesKey)
    }

    private func loadFavorites() {
        if let savedLocations = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            favoriteLocations = savedLocations
        }
    }
}

extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            fetchWeather(for: location)
            fetchLocationName(from: location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error)")
    }
}
