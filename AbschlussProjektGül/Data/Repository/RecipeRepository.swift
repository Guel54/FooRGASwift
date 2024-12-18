//
//  RecipeRepository.swift
//  AbschlussProjektGül
//
//  Created by Gül Köse on 18.12.24.
//

import Foundation

class RecipeRepository {
    func getRandomRecipe() async throws -> Meal {
        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(MealResponse.self, from: data)
        guard let meal = result.meals?.first else {
            throw HTTPError.fetchFailed
        }
        return meal
    }
    /// Lädt mehrere zufällige Rezepte
        func getMultipleRandomRecipes(count: Int) async throws -> [Meal] {
            var recipes: [Meal] = []
            var fetchErrors: [Error] = []

            for _ in 1...count {
                do {
                    let meal = try await getRandomRecipe()
                    recipes.append(meal)
                } catch {
                    fetchErrors.append(error)
                }
            }

            if let firstError = fetchErrors.first {
                throw firstError
            }

            return recipes
        }
    func searchRecipe(byName name: String) async throws -> [Meal] {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(name)"
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(MealResponse.self, from: data)
        return result.meals ?? []
    }
}

enum HTTPError: Error {
    case invalidURL, fetchFailed
    var message: String {
        switch self {
        case .invalidURL:
            return "Die URL ist ungültig"
        case .fetchFailed:
            return "Laden ist fehlgeschlagen"
        }
    }
}
