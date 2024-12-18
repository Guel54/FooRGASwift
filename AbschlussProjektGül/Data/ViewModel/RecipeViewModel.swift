//
//  RecipeViewModel.swift
//  AbschlussProjektGül
//
//  Created by Gül Köse on 18.12.24.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var randomMeals: [Meal] = []
    @Published var searchResults: [Meal] = []
    private let repository = RecipeRepository()

    func fetchRandomRecipe() {
        Task {
            do {
                let meal = try await repository.getRandomRecipe()
                randomMeals = [meal]
            } catch {
                print("Fehler beim Abrufen eines zufälligen Rezepts: \(error)")
            }
        }
    }

    func fetchMultipleRandomRecipes(count: Int) {
        Task {
            do {
                randomMeals = try await repository.getMultipleRandomRecipes(count: count)
            } catch {
                print("Fehler beim Abrufen mehrerer zufälliger Rezepte: \(error)")
            }
        }
    }

    func searchRecipes(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
        Task {
            do {
                searchResults = try await repository.searchRecipe(byName: query)
            } catch {
                print("Fehler bei der Rezeptsuche: \(error)")
            }
        }
    }
}
