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
    var isFavorite: Bool

    enum Difficulty: String, Codable {
        case easy, medium, hard
    }
}

struct Ingredient: Identifiable, Codable {
    let id: UUID
    let name: String
    let amount: Double
    let unit: String
}
