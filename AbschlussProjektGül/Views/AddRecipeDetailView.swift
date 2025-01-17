import SwiftUI

struct AddRecipeDetailView: View {
    var recipe: AddRecipe
    
    var body: some View {
        ZStack {
            Color("salbeiGrun")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(recipe.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    Text(recipe.description)
                        .font(.body)
                        .padding(.bottom)
                    
                    Text("Kochzeit: \(recipe.cookTime)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    
                    Text("Zutaten:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("- \(ingredient)")
                            .font(.body)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Rezeptdetails")
        .navigationBarTitleDisplayMode(.inline)
    }
}
