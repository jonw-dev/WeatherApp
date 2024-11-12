//
//  RainingAnimalView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct RainingAnimalView: View {
    @State private var offset = CGSize.zero
    private let animalOffsetHeight: CGFloat = UIScreen.main.bounds.height + 200
    private let pawprints = ["pawprint.fill", "pawprint"]
    
    var body: some View {
        Image(systemName: pawprints.randomElement() ?? "pawprint.fill")
            .font(.largeTitle)
            .foregroundColor(.white)
            .offset(y: offset.height)
            .onAppear {
                withAnimation {
                    offset = CGSize(width: 0, height: animalOffsetHeight)
                }
            }
    }
}

struct RainingAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        RainingAnimalView()
    }
}

