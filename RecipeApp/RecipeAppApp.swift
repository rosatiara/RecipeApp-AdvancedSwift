//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 29/10/24.
//

import SwiftUI

@main
struct RecipeApp: App {
    let recipeService = RecipeService()

    var body: some Scene {
        WindowGroup {
            RecipeListView(recipeService: recipeService)
        }
    }
}
