//
//  SearchLocationView.swift
//  WeatherApp
//
//  Created by Jon Williams on 06/11/2024.
//

import SwiftUI

struct SearchLocationView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @Environment(\.dismiss) var dismiss
    @State private var locationName = ""
    @State private var showError = false

    private let padding: CGFloat = 16
    private let buttonCornerRadius: CGFloat = 8

    var body: some View {
        VStack {
            TextField("Enter location", text: $locationName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(padding)
            
            Button(action: {
                if locationName.isEmpty {
                    showError = true
                } else {
                    viewModel.addFavorite(locationName)
                    dismiss()
                }
            }) {
                Text("Add to Favorites")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(buttonCornerRadius)
            }
            .padding(padding)
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Invalid Location"),
                    message: Text("Please enter a valid location name."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding(padding)
    }
}

struct SearchLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLocationView(viewModel: WeatherViewModel())
    }
}



