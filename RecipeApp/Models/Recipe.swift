//
//  Models.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 29/10/24.
//

import SwiftUI

extension String {
    /// ====================================================
    /// trims whitespace and newlines from the beginning and end of the string.
    /// ====================================================
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// ====================================================
    /// trims specific characters (e.g., quotes) from the string.
    /// ====================================================
    func trimmedCharacters(_ characters: CharacterSet) -> String {
        self.trimmingCharacters(in: characters)
    }

}

struct Recipe: Identifiable, Codable {
    let id: UUID
    var name: String
    let ingredients: [Ingredient]
    var instructions: [String]
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
        self.name = name.trimmed() /// trim whitespace from name
        self.ingredients = ingredients
        self.instructions = instructions().map { $0.trimmed() } /// trim each instruction
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
