//
//  SnowyBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct SnowyBackgroundView: View {
    private let snowflakeCount = 20
    private let animationDuration: Double = 5
    private let animationDelay: Double = 0.3

    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            ForEach(0..<snowflakeCount, id: \.self) { index in
                SnowfallView()
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                              y: CGFloat.random(in: -100...0))
                    .animation(
                        Animation.linear(duration: animationDuration)
                            .repeatForever(autoreverses: false)
                            .delay(Double(index) * animationDelay)
                    )
            }
        }
    }
}

struct SnowyBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SnowyBackgroundView()
    }
}




