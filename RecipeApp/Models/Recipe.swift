//
//  Models.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 29/10/24.
//

import SwiftUI

struct Recipe: Identifiable, Codable {
    let id: UUID
    let name: String
    let ingredients: [Ingredient]
    let instructions: [String]
    let cookingTime: Int
    let difficulty: Difficulty
    var isFavorite: Bool = false

    enum Difficulty: String, Codable {
        case easy, medium, hard
    }

    enum KindOfRecipe: String, Codable {
        case regular, vegan, fatFree, carbFree
    }

    init(id: UUID = UUID(),
         name: String,
         ingredients: [Ingredient],
         @InstructionsBuilder instructions: () -> [String],
         cookingTime: Int,
         difficulty: Difficulty,
         isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions()
        self.cookingTime = cookingTime
        self.difficulty = difficulty
        self.isFavorite = isFavorite
    }

    static func getDefaultRecipes() -> [Recipe] {
        return [
            Recipe(
                name: "Fried Rice",
                ingredients: [],
                instructions: {
                    "First we crack some egg"
                    "Then we add some water"
                    "Then we add some rice"
                    "Then we add some salt"
                    "Then we add some pepper"
                    "Stir till it smells great 😁"
                    "Plate it"
                    "Enjoy your whats so called \"FRIED RICE\"!"
                },
                cookingTime: 40,
                difficulty: .easy
            )
        ]
    }
}

struct Ingredient: Identifiable, Codable {
    let id: UUID
    let name: String
    let amount: Double
    let unit: String
}
