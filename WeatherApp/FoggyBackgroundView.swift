//
//  FoggyBackgroundView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

//struct FoggyBackgroundView: View {
//    private let fogCount = 10
//    private let fogAnimationDuration: Double = 10
//    private let fogAnimationDelay: Double = 1
//    private let maxOffsetX: CGFloat = 100
//    private let maxOffsetY: CGFloat = 50
//
//    var body: some View {
//        ZStack {
//            Color.gray.opacity(0.3)
//                .ignoresSafeArea()
//
//            ForEach(0..<fogCount, id: \.self) { index in
//                FogView()
//                    .offset(x: CGFloat.random(in: -maxOffsetX...maxOffsetX), y: CGFloat.random(in: -maxOffsetY...maxOffsetY))
//                    .animation(
//                        Animation.linear(duration: fogAnimationDuration)
//                            .repeatForever(autoreverses: false)
//                            .delay(Double(index) * fogAnimationDelay)
//                    )
//            }
//        }
//    }
//}
//
//struct FoggyBackgroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoggyBackgroundView()
//    }
//}


