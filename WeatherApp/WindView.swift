//
//  WindView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct WindView: View {
    @State private var offset = CGSize.zero
    private let windWidth: CGFloat = 150
    private let windHeight: CGFloat = 5
    private let windOpacity: Double = 0.5

    var body: some View {
        Capsule()
            .fill(Color.black.opacity(windOpacity))
            .frame(width: windWidth, height: windHeight)
            .offset(x: offset.width)
            .onAppear {
                withAnimation {
                    offset.width = UIScreen.main.bounds.width
                }
            }
    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView()
    }
}

