//
//  RecipeViewMoel.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 31/10/24.
//

import Foundation
import SwiftUI

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var searchText = ""

    private let recipeService: RecipeService

    init(recipeService: RecipeService) {
        self.recipeService = recipeService
    }

    func fetchRecipes() async {
        do {
            let fetchedRecipes = try await recipeService.fetchRecipes()
            recipes = fetchedRecipes
        } catch {
            print("Error fetching recipes: \(error)")
        }
    }

    func searchRecipes() async {
        let searchSequence = RecipeSearchSequence(searchTerm: searchText, recipeService: recipeService)
        do {
            for try await results in searchSequence {
                recipes = results
            }
        } catch {
            print("Error searching recipes: \(error)")
        }
    }

    func addRecipe(_ recipe: Recipe) async {
        await recipeService.addRecipe(recipe)
        await fetchRecipes()
    }
}
