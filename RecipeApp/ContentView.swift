//
//  ContentView.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 29/10/24.
//

import SwiftUI

// MARK: - Recipe Creation Macro
@attached(member, names: named(init))
macro RecipeInit() = #externalMacro(module: "RecipeMacros", type: "RecipeInitMacro")

// MARK: - Recipe Service Actor
actor RecipeService {
    private var recipes: [Recipe] = []
    private let saveQueue = DispatchQueue(label: "com.recipeapp.saveQueue")

    func fetchRecipes() async throws -> [Recipe] {
        try await Task.sleep(nanoseconds: 1_000_000_000)

        return Recipe.getDefaultRecipes()
    }

    func addRecipe(_ recipe: Recipe) async {
        recipes.append(recipe)
        await saveRecipes()
    }

    private func saveRecipes() async {
        await withCheckedContinuation { continuation in
            saveQueue.async {
                continuation.resume()
            }
        }
    }
}

// MARK: - Task Group Example
extension RecipeService {
    func fetchMultipleRecipes(ids: [UUID]) async throws -> [Recipe] {
        try await withThrowingTaskGroup(of: Recipe.self) { group in
            for id in ids {
                group.addTask {
                    try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
                    return await self.recipes.first { $0.id == id }!
                }
            }

            var fetchedRecipes: [Recipe] = []
            for try await recipe in group {
                fetchedRecipes.append(recipe)
            }

            return fetchedRecipes
        }
    }
}


// MARK: - Recipe Repository Protocol with Associated Type
protocol RecipeRepository {
    associatedtype RecipeType

    func fetchAll() async throws -> [RecipeType]
    func save(_ recipe: RecipeType) async throws
}

