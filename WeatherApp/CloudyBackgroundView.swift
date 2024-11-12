//
//  CloudyBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct CloudyBackgroundView: View {
    private let cloudCount = 10
    private let cloudAnimationDuration: Double = 10
    private let cloudAnimationDelay: Double = 4
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                .ignoresSafeArea()
            
            ForEach(0..<cloudCount, id: \.self) { index in
                CloudView()
                    .offset(x: -UIScreen.main.bounds.width, y: CGFloat.random(in: -50...50))
                    .animation(
                        Animation.linear(duration: cloudAnimationDuration)
                            .repeatForever(autoreverses: false)
                            .delay(Double(index) * cloudAnimationDelay)
                    )
            }
        }
    }
}

struct CloudyBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CloudyBackgroundView()
    }
}


