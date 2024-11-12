//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//


import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WeatherViewModel())
        }
    }
}

