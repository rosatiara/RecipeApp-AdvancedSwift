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
        case easy,medium, hard
    }

    static func getDefaultRecipes() -> [Recipe] {
        return [
            .init(id: UUID(),
                  name: "Fried Rice",
                  ingredients: [],
                  instructions: [
                    #"""
                        First we crack some egg
                        Then we add some water
                        Then we add some rice
                        Then we add some salt
                        Then we add some pepper
                        Stir till it smells great 😁
                        Plate it
                        Enjoy your whats so called """FRIED RICE"""!
                    """#
                  ],
                  cookingTime: 40,
                  difficulty: .easy)
        ]
    }
}

struct Ingredient: Identifiable, Codable {
    let id: UUID
    let name: String
    let amount: Double
    let unit: String
}
