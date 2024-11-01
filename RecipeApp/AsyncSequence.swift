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
}
