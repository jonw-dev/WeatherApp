//
//  SnowfallView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct SnowfallView: View {
    @State private var offset = CGSize.zero
    private let snowflakeWidth: CGFloat = 20
    private let snowflakeHeight: CGFloat = 20
    private let snowflakeOpacity: Double = 0.8
    private let snowflakeBlurRadius: CGFloat = 5
    private let snowflakeAnimationDistance: CGFloat = UIScreen.main.bounds.height + 200

    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: snowflakeWidth, height: snowflakeHeight)
            .opacity(snowflakeOpacity)
            .blur(radius: snowflakeBlurRadius)
            .offset(y: offset.height)
            .onAppear {
                withAnimation {
                    offset = CGSize(width: 0, height: snowflakeAnimationDistance)
                }
            }
    }
}

struct SnowfallView_Previews: PreviewProvider {
    static var previews: some View {
        SnowfallView()
    }
}

