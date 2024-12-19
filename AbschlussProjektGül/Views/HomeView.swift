import SwiftUI


struct HomeView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @StateObject private var recipeViewModel = RecipeViewModel()
    //Mutter Viewmodel

    var body: some View {
        NavigationView {
            VStack {
                // Header und Suchleiste
                VStack {
                    HeaderView()
                    SearchBar(searchText: $searchText) {
                        isSearching = true
                    }
                    .onChange(of: searchText) { newValue in
                        recipeViewModel.searchRecipes(query: newValue)
                    }
                }

                NavigationLink(destination: SearchResultsView(searchText: $searchText, viewModel: recipeViewModel), isActive: $isSearching) {
                    EmptyView()
                }
                .hidden()

                // Rezeptanzeige
                ScrollView {
                    LazyVStack {
                        // Zufällige Rezepte anzeigen
                        if recipeViewModel.randomMeals.isEmpty {
                            Text("Keine Rezepte verfügbar")
                                .font(.title)
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(recipeViewModel.randomMeals) { meal in
                                NavigationLink(destination: DetailView(meal: meal)) {
                                    RecipeListRowView(meal: meal)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .onAppear {
                    // Rezepte beim Laden der Ansicht laden
                    recipeViewModel.fetchMultipleRandomRecipes(count: 10)
                }
                .overlay(alignment: .bottomTrailing) {
                    FloatingActionButton(action: {
                        recipeViewModel.fetchMultipleRandomRecipes(count: 10)
                    })
                }
            }
        }
    }
}


struct FloatingActionButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.clockwise")
                .font(.title)
                .frame(width: 60, height: 60)
                .background(Color.purple)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
        .padding()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
