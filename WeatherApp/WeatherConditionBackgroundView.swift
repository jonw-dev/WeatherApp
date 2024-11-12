//
//  WeatherConditionBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct WeatherConditionBackgroundView: View {
    let condition: WeatherCondition
    
    var body: some View {
        condition.toView()
            .ignoresSafeArea()
    }
}

// Individual views for different weather conditions
struct ClearSkyView: View {
    var body: some View {
        Color.blue
            .ignoresSafeArea()
    }
}

struct CloudySkyView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
        }
        .ignoresSafeArea()
    }
}

struct RainyView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
        }
        .ignoresSafeArea()
    }
}

struct FoggyBackgroundView: View {
    var body: some View {
        Color.gray.opacity(0.3)
            .ignoresSafeArea()
    }
}

struct StormyBackgroundView: View {
    @State private var flashOpacity: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            Rectangle()
                .fill(Color.white)
                .opacity(flashOpacity)
                .onAppear {
                    flashLightning()
                }
        }
    }
    
    
    
    private func flashLightning() {
        withAnimation(
            Animation.easeInOut(duration: 0.1)
                .repeatForever(autoreverses: true)
                .delay(Double.random(in: 1.0...3.0))
        ) {
            flashOpacity = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(
                Animation.easeInOut(duration: 0.1)
                    .repeatForever(autoreverses: true)
                    .delay(Double.random(in: 1.0...3.0))
            ) {
                flashOpacity = 0.0
            }
        }
    }
}

struct WeatherConditionBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherConditionBackgroundView(condition: .clear)
    }
}




