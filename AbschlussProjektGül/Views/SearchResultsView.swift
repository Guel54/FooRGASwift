import SwiftUI

struct SearchResultsView: View {
    @Binding var searchText: String
    @ObservedObject var viewModel: RecipeViewModel
    
    var body: some View {
        ZStack {
            // Hintergrundfarbe
            Color("salbeiGrun")
                .ignoresSafeArea() // Deckt den gesamten Hintergrund ab
            
            VStack {
                Text("Results for \"\(searchText)\"")
                    .font(.largeTitle)
                    .shadow(radius: 10)
                    .foregroundColor(Color("dunkelGrun"))
                    .bold()
                    .padding()
                
                List(viewModel.searchResults) { meal in
                    // NavigationLink hinzufügen
                    NavigationLink(destination: SearchDetailView(meal: meal)) {
                        SearchResultRow(meal: meal)
                    }
                }
                .scrollContentBackground(.hidden) // Entfernt den Standard-Listenhintergrund
                .background(Color.clear) // Setzt den Listenhintergrund transparent
            }
        }
        .navigationBarTitleDisplayMode(.inline) // Falls gewünscht, Titelstil anpassen
        .onAppear {
            viewModel.searchRecipes(query: searchText)
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
                    .cornerRadius(15)
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 70, maxHeight: 80)
            .cornerRadius(5)
            .scaledToFill()
            .shadow(radius: 10)
            
            Text(meal.name ?? "Unbekannt")
                .font(.headline)
                .padding(.leading, 8)
                .bold()
                .shadow(radius: 10)
                .foregroundColor(Color("gelb"))
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    SearchResultsView(searchText: .constant("Pizza"), viewModel: .init())
}
