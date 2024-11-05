//
//  RecipeManager.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 05/11/24.
//

import Foundation
import Distributed
import SwiftUI

public typealias DefaultDistributedActorSystem = LocalTestingDistributedActorSystem

@available(iOS 5.7, *)
protocol RecipeManaging: DistributedActor {
    func addRecipe(_ recipe: Recipe) async throws
    func updateRecipe(_ recipe: Recipe) async throws
    func getRecipe(by id: UUID) async throws -> Recipe?
    func getAllRecipes() async throws -> [Recipe]
}

@available(iOS 5.7, *)
distributed actor RecipeManager: RecipeManaging {
    typealias ActorSystem = DefaultDistributedActorSystem

    private var recipes: [UUID: Recipe] = [:]

    init(system: ActorSystem) {
        self.actorSystem = system
    }

    func addRecipe(_ recipe: Recipe) async throws {
        recipes[recipe.id] = recipe
        print("Recipe added: \(recipe.name)")
    }

    func updateRecipe(_ recipe: Recipe) async throws {
        guard recipes[recipe.id] != nil else {
            throw RecipeError.notFound
        }
        recipes[recipe.id] = recipe
        print("Recipe updated: \(recipe.name)")
    }

    func getRecipe(by id: UUID) async throws -> Recipe? {
        return recipes[id]
    }

    func getAllRecipes() async throws -> [Recipe] {
        return Array(recipes.values)
    }
}



