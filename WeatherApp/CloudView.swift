//
//  CloudView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct CloudView: View {
    @State private var offset = CGSize.zero
    private let cloudWidth: CGFloat = 20
    private let cloudHeight: CGFloat = 5
    private let cloudCornerRadius: CGFloat = 10
    private let cloudOpacity: Double = 0.8
    private let cloudScale: CGFloat = 0.2
    
    var body: some View {
        Image("cloudImage2")
            .frame(width: cloudWidth, height: cloudHeight)
            .opacity(cloudOpacity)
            .scaleEffect(cloudScale)
            .offset(x: offset.width)
            .onAppear {
                withAnimation {
                    offset.width = UIScreen.main.bounds.width
                }
//        RoundedRectangle(cornerRadius: cloudCornerRadius)
//            .fill(Color.black)
//            .frame(width: cloudWidth, height: cloudHeight)
//            .opacity(cloudOpacity)
//            .scaleEffect(cloudScale)
//            .padding(.vertical, 10)
//            .offset(x: offset.width)
//            .onAppear {
//                withAnimation {
//                    offset.width = UIScreen.main.bounds.width
//                }
            }
    }
}

struct CloudView_Previews: PreviewProvider {
    static var previews: some View {
        CloudView()
    }
}

