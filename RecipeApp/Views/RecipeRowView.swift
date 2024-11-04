//
//  RecipeRowView.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 31/10/24.
//

import Foundation
import SwiftUI

struct RecipeRowView<Content: View>: View {
    let recipe: Recipe

    let favouriteView: (Bool) -> Content

    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text("\(recipe.cookingTime) minutes • \(recipe.difficulty.rawValue.capitalized)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            favouriteView(recipe.isFavorite)
        }
    }
}
