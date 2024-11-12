//
//  FogView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct FogView: View {
    @State private var offset = CGSize.zero
    private let fogWidth: CGFloat = 200
    private let fogHeight: CGFloat = 30
    private let fogCornerRadius: CGFloat = 10
    private let fogOpacity: Double = 0.2
    private let fogBlurRadius: CGFloat = 10

    var body: some View {
        RoundedRectangle(cornerRadius: fogCornerRadius)
            .fill(Color.white.opacity(fogOpacity))
            .frame(width: fogWidth, height: fogHeight)
            .blur(radius: fogBlurRadius)
            .offset(x: offset.width)
            .onAppear {
                withAnimation {
                    offset.width = UIScreen.main.bounds.width
                }
            }
    }
}

struct FogView_Previews: PreviewProvider {
    static var previews: some View {
        FogView()
    }
}

