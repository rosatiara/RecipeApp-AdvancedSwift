//
//  RecipeRowView.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 31/10/24.
//

import Foundation
import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.name)
                .font(.headline)
            Text("\(recipe.cookingTime) minutes • \(recipe.difficulty.rawValue.capitalized)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
