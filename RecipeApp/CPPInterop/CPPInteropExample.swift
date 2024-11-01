//
//  CPPInteropExample.swift
//  RecipeApp
//
//  Created by Rosa Tiara Galuh on 30/10/24.
//

import Foundation
import SwiftUI

#if canImport(CRecipe)
import CRecipe

class RecipeCalculator {
    private var calculator: OpaquePointer?

    init() {
        calculator = recipe_calculator_create()
    }

    deinit {
        if let calculator = calculator {
            recipe_calculator_destroy(calculator)
        }
    }

    func scaleIngredients(by factor: Double) -> Double {
        guard let calculator = calculator else { return 0.0 }
        return recipe_calculator_scale(calculator, factor)
    }
}
#endif
