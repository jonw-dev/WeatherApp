//
//  FavoriteLocationsView.swift
//  WeatherApp
//
//  Created by Jon Williams on 07/11/2024.
//

import SwiftUI

struct FavoriteLocationsView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            ForEach(viewModel.favoriteLocations, id: \.self) { location in
                Button(action: {
                    viewModel.locationName = location
                    dismiss()
                }) {
                    Text(location)
                        .foregroundColor(.black)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle("Favorite Locations")
        .toolbar {
            EditButton()
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        viewModel.favoriteLocations.remove(atOffsets: offsets)
        viewModel.saveFavorites()
    }
}

struct FavoriteLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteLocationsView(viewModel: WeatherViewModel())
    }
}

