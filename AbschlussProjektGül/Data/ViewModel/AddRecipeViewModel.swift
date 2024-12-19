//
//  AddRecipeViewModel.swift
//  KopieTesting
//
//  Created by Gül Köse on 15.12.24.
//

import SwiftUI
import FirebaseAuth

class AddRecipeViewModel: ObservableObject {
    @Published var recipes: [AddRecipe] = []
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var isLoading: Bool = false
    @Published var userId: String = ""

    private let repository = AddRecipeRepository()

    init() {
        signInAnonymously()
    }

    // Anonyme Anmeldung
    private func signInAnonymously() {
        Auth.auth().signInAnonymously { [weak self] authResult, error in
            if let user = authResult?.user {
                self?.userId = user.uid
                self?.loadRecipes()
            } else if let error = error {
                print("Fehler bei der anonymen Anmeldung: \(error.localizedDescription)")
            }
        }
    }

    // Rezepte laden
    func loadRecipes() {
        guard !userId.isEmpty else { return }
        isLoading = true
        repository.fetchRecipes(for: userId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let recipes):
                    self?.recipes = recipes
                case .failure(let error):
                    print("Fehler beim Laden der Rezepte: \(error.localizedDescription)")
                }
            }
        }
    }

    // Rezept hinzufügen
    func addRecipe() {
        guard !title.isEmpty, !description.isEmpty, !userId.isEmpty else { return }
        let newRecipe = AddRecipe(userId: userId, title: title, description: description)
        repository.addRecipe(recipe: newRecipe) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.title = ""
                    self?.description = ""
                    self?.loadRecipes()
                case .failure(let error):
                    print("Fehler beim Hinzufügen des Rezepts: \(error.localizedDescription)")
                }
            }
        }
    }

    // Rezept löschen
    func deleteRecipe(at offsets: IndexSet) {
        offsets.forEach { index in
            let recipe = recipes[index]
            guard let recipeId = recipe.id else { return }
            repository.deleteRecipe(recipeId: recipeId) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success:
                        self?.loadRecipes()
                    case .failure(let error):
                        print("Fehler beim Löschen des Rezepts: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
