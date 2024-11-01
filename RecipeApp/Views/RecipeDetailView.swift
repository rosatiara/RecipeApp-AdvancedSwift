//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 31/10/24.
//

import SwiftUI
import Foundation

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Ingredients")
                    .font(.title2)
                    .bold()

                ForEach(recipe.ingredients) { ingredient in
                    Text("• \(ingredient.amount) \(ingredient.unit) \(ingredient.name)")
                }

                Text("Instructions")
                    .font(.title2)
                    .bold()
                    .padding(.top)

                ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, instruction in
                    Text("\(index + 1). \(instruction)")
                        .padding(.bottom, 4)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.name)
    }
}

