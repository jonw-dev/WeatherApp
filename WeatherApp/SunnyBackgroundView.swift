//
//  SunnyBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct SunnyBackgroundView: View {
    @State private var isAnimating = false
    private let sunDiameter: CGFloat = 150
    private let sunColor = Color.yellow
    private let backgroundColor = Color.blue.opacity(0.5)
    private let animationDuration: Double = 1.5
    private let strokeWidth: CGFloat = 5
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            Circle()
                .fill(sunColor)
                .frame(width: sunDiameter, height: sunDiameter)
                .overlay(
                    Circle()
                        .stroke(sunColor, lineWidth: strokeWidth)
                        .scaleEffect(isAnimating ? 1.3 : 1.0)
                        .opacity(isAnimating ? 0.0 : 0.5)
                        .animation(
                            Animation.easeInOut(duration: animationDuration)
                                .repeatForever(),
                            value: isAnimating
                        )
                )
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct SunnyBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SunnyBackgroundView()
    }
}


