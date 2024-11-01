//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 31/10/24.
//

import Foundation
import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel: RecipeListViewModel

    init(recipeService: RecipeService) {
        _viewModel = StateObject(wrappedValue: RecipeListViewModel(recipeService: recipeService))
    }

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeRowView(recipe: recipe)
                }
            }
            .navigationTitle("Recipes")
            .searchable(text: $viewModel.searchText)
            .onChange(of: viewModel.searchText) { _ in
                Task {
                    await viewModel.searchRecipes()
                }
            }
            .task {
                await viewModel.fetchRecipes()
            }
        }
    }
}
