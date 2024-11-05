//
//  Enums.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 05/11/24.
//

import Foundation

enum RecipeError: Error {
    case notFound
}

enum Difficulty: String, Codable {
    case easy, medium, hard
}

enum KindOfRecipe: String, Codable {
    case regular, vegan, fatFree, carbFree
}
