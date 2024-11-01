//
//  InstructionsBuilder.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 30/10/24.
//

import SwiftUI

@resultBuilder
struct InstructionsBuilder {
    static func buildBlock(_ components: String...) -> [String] {
        components
    }

    static func buildOptional(_ component: [String]?) -> [String] {
        component ?? []
    }

    static func buildEither(first component: [String]) -> [String] {
        component
    }

    static func buildEither(second component: [String]) -> [String] {
        component
    }
}
