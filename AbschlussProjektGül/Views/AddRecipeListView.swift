import SwiftUI

struct AddRecipeListView: View {
    @ObservedObject var viewModel: AddRecipeViewModel

    var body: some View {
        ZStack {
            Color("salbeiGrun")
                .ignoresSafeArea()
            
            List {
                ForEach(viewModel.recipes) { recipe in
                    NavigationLink(destination: AddRecipeDetailView(recipe: recipe)) {
                        HStack {
                            Circle()
                                .fill(Color("dunkelGelb"))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Text(recipe.title.prefix(1))
                                        .font(.headline)
                                        .foregroundColor(.white)
                                )
                                .shadow(radius: 4)

                            VStack(alignment: .leading, spacing: 8) {
                                Text(recipe.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .shadow(radius: 1)

                                Text(recipe.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.leading, 8)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete(perform: viewModel.deleteRecipe)
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Gespeicherte Rezepte")
        .navigationBarTitleDisplayMode(.inline)
    }
}
        



