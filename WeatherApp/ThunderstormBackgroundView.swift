//
//  ThunderstormBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct ThunderstormBackgroundView: View {
    @State private var flashOpacity: Double = 0.0
    private let backgroundColor = Color.black.opacity(0.8)
    private let flashColor = Color.white
    private let flashDuration: Double = 0.1
    private let flashDelay: Double = 1.5
    private let maxFlashOpacity: Double = 0.5

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            Rectangle()
                .fill(flashColor)
                .opacity(flashOpacity)
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: flashDuration)
                            .repeatForever(autoreverses: true)
                            .delay(flashDelay)
                    ) {
                        flashOpacity = flashOpacity == 0.0 ? maxFlashOpacity : 0.0
                    }
                }
        }
    }
}

struct ThunderstormBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ThunderstormBackgroundView()
    }
}

