//
//  AsyncSequence.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 31/10/24.
//

import Foundation
import SwiftUI

// MARK: - AsyncSequence for Recipe Search

struct RecipeSearchSequence: AsyncSequence {
    typealias Element = [Recipe]

    let searchTerm: String
    let recipeService: RecipeService

    struct AsyncIterator: AsyncIteratorProtocol {
        var hasDeliveredResults = false
        let searchTerm: String
        let recipeService: RecipeService

        mutating func next() async throws -> [Recipe]? {
            if hasDeliveredResults {
                return nil
            }

            hasDeliveredResults = true
            let allRecipes = try await recipeService.fetchRecipes()
            return allRecipes.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
        }
    }

    func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(searchTerm: searchTerm, recipeService: recipeService)
    }

    func stream() -> AsyncThrowingStream<Recipe, Error> {
        AsyncThrowingStream { continuation in
            Task {
                do {
                    let allRecipes = try await recipeService.fetchRecipes()
                    for recipe in allRecipes where recipe.name.localizedCaseInsensitiveContains(searchTerm) {
                        continuation.yield(recipe)
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }

    func fetchRecipes() async throws -> [Recipe] {
            /// ==========================================
            /// this simulates a network fetch with a potential failure.
            /// ==========================================

          return try await withUnsafeThrowingContinuation { continuation in
              /// simulating an asynchronous network call that can fail.....
              DispatchQueue.global().async {
                  Thread.sleep(forTimeInterval: 1) /// simulate network delay

                  /// simulate success
                  let recipes = [
                    Recipe(
                        name: "Fried Rice",
                        ingredients: [],
                        instructions: {
                            """
                            1. Crack some egg
                            2. Add some water
                            3. Add some rice
                            4. Then we add some salt
                            5. Then we add some pepper
                            6. Stir till it smells great 😁
                            7. Plate it
                            8. Enjoy your what's so called "FRIED RICE"!
                            """
                        },
                        cookingTime: 40,
                        difficulty: .easy,
                        kind: .regular
                    )
                  ]
                  /// simulate success (call continuation.resume(returning:))
                  continuation.resume(returning: recipes)

                  /// if there was an error,
                  ///continuation.resume(throwing: someError)
              }
          }
      }
}


