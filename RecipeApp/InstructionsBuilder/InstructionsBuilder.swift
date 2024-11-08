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
        components.flatMap { component in
            component.split(separator: "\n").enumerated().map { index, line in
                "\(index + 1). \(line.trimmingCharacters(in: .whitespaces))"
            }
        }
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
