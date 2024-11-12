//
//  WindyBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct WindyBackgroundView: View {
    private let windCount = 10
    private let windAnimationDuration: Double = 5
    private let windAnimationDelay: Double = 0.5

    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            ForEach(0..<windCount, id: \.self) { index in
                WindView()
                    .offset(x: -UIScreen.main.bounds.width)
                    .animation(
                        Animation.linear(duration: windAnimationDuration)
                            .repeatForever(autoreverses: false)
                            .delay(Double(index) * windAnimationDelay)
                    )
            }
        }
    }
}

struct WindyBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WindyBackgroundView()
    }
}


