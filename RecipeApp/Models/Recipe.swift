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
    var kind: KindOfRecipe

    init(id: UUID = UUID(),
         name: String,
         ingredients: [Ingredient],
         @InstructionsBuilder instructions: () -> [String],
         cookingTime: Int,
         difficulty: Difficulty,
         isFavorite: Bool = false,
         kind: KindOfRecipe) {
        self.id = id
        self.name = name.trimmed() /// trim whitespace from name
        self.ingredients = ingredients
        self.instructions = instructions().map { $0.trimmed() } /// trim each instruction
        self.cookingTime = cookingTime
        self.difficulty = difficulty
        self.isFavorite = isFavorite
        self.kind = kind
    }

    static func getDefaultRecipes() -> [Recipe] {
        return [
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
            ),
            Recipe(
                name: "Overnight Oats Chocolate",
                ingredients: [],
                instructions: {
                    """
                    1. Pour oats into a glass or bowl
                    2. Add 2 scoops of milk
                    3. Stir
                    4. Add some cocoa powder
                    5. Stir again
                    6. Add slices of banana
                    7. Refrigerate for 3 hours or overnight
                    8. "Enjoy the overnight oats"!
                    """
                },
                cookingTime: 10,
                difficulty: .easy,
                kind: .vegan
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

