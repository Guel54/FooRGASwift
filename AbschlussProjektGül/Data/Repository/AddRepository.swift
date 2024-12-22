//
//  AddRepository.swift
//  Test123
//
//  Created by Gül Köse on 14.12.24.
//


import FirebaseFirestore


class AddRecipeRepository {
    private let database = Firestore.firestore()

    // Rezept hinzufügen
    func addRecipe(recipe: AddRecipe, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            _ = try database.collection("recipes").addDocument(from: recipe)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    // Alle Rezepte eines Nutzers laden
    func fetchRecipes(for userId: String, completion: @escaping (Result<[AddRecipe], Error>) -> Void) {
        database.collection("recipes")
            .whereField("userId", isEqualTo: userId)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                let recipes = snapshot?.documents.compactMap { document in
                    try? document.data(as: AddRecipe.self)
                } ?? []
                completion(.success(recipes))
            }
    }

    // Rezept löschen
    func deleteRecipe(recipeId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        database.collection("recipes").document(recipeId).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
