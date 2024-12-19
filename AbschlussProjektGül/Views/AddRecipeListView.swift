//
//  AddRecipeListView.swift
//  KopieTesting
//
//  Created by Gül Köse on 15.12.24.
//

import SwiftUI

struct AddRecipeListView: View {
    @ObservedObject var viewModel: AddRecipeViewModel

    var body: some View {
        List {
            ForEach(viewModel.recipes) { recipe in
                VStack(alignment: .leading, spacing: 5) {
                    Text(recipe.title)
                        .font(.headline)
                        .foregroundColor(.pink)
                    Text(recipe.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(8)
            }
            .onDelete(perform: viewModel.deleteRecipe)
        }
        .navigationTitle("Gespeicherte Rezepte")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Vorschau für AddRecipeListView
struct AddRecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = AddRecipeViewModel()
        mockViewModel.recipes = [
            AddRecipe(userId: "123", title: "Pfannkuchen", description: "Lecker und fluffig."),
            AddRecipe(userId: "456", title: "Spaghetti Bolognese", description: "Herzhaft und sättigend."),
            AddRecipe(userId: "789", title: "Salat Bowl", description: "Gesund und frisch.")
        ]
        return NavigationView {
            AddRecipeListView(viewModel: mockViewModel)
        }
    }
}
