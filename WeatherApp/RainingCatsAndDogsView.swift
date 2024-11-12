//
//  RainingCatsAndDogsView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct RainingCatsAndDogsView: View {
    private let animalCount = 40
    private let animationDuration: Double = 2.5
    private let animationDelay: Double = 0.2

    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()

            ForEach(0..<animalCount, id: \.self) { index in
                RainingAnimalView()
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

struct RainingCatsAndDogsView_Previews: PreviewProvider {
    static var previews: some View {
        RainingCatsAndDogsView()
    }
}


