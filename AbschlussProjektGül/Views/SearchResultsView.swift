

import SwiftUI

struct SearchResultsView: View {
    
    @Binding var searchText: String
    @ObservedObject var viewModel: RecipeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Results for \"\(searchText)\"")
                    .font(.title2)
                    .padding()

                List(viewModel.searchResults) { meal in
                    // NavigationLink hinzufügen
                    NavigationLink(destination: SearchDetailView(meal: meal)) {
                        SearchResultRow(meal: meal) // Hier wird eine neue Zeile zur Anzeige des Ergebnisses verwendet
                    }
                }
            }
            .onAppear {
                viewModel.searchRecipes(query: searchText)
            }
        }
    }
}

struct SearchResultRow: View {
    var meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.image ?? "")) { image in
                image.resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 70, maxHeight: 80)
            .cornerRadius(5)
            .scaledToFill()
            
            Text(meal.name ?? "Unbekannt")
                .font(.headline)
                .padding(.leading, 8)
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    SearchResultsView(searchText: .constant("Pizza"), viewModel: .init())
}
