import SwiftUI

struct AddRecipeListView: View {
    @ObservedObject var viewModel: AddRecipeViewModel

    var body: some View {
        ZStack {
            // Hintergrundfarbe
            Color("Salbeigrün")
                .ignoresSafeArea()
            
            List {
                ForEach(viewModel.recipes) { recipe in
                    HStack {
                        // Platzhalter für ein Rezeptbild (optional)
                        Circle()
                            .fill(Color("dunkelGelb"))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Text(recipe.title.prefix(1)) // Erster Buchstabe des Titels
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(radius: 4)

                        VStack(alignment: .leading, spacing: 8) {
                            // Titel des Rezepts
                            Text(recipe.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .shadow(radius: 1)

                            // Beschreibung des Rezepts
                            Text(recipe.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.vertical, 8)
                }
                .onDelete(perform: viewModel.deleteRecipe)
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden) // Verhindert graue Hintergründe in der Liste
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
            AddRecipe(userId: "123", title: "Pfannkuchen", description: "Leckere goldbraune Pfannkuchen."),
            AddRecipe(userId: "456", title: "Salat", description: "Frischer Salat mit Dressing."),
        ]
        return AddRecipeListView(viewModel: mockViewModel)
    }
}
