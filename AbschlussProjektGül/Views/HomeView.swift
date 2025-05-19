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
                    .onChange(of: searchText) { oldValue, newValue in
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
                                NavigationLink(destination: HomeDetailView(meal: meal)) {
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
            .background(Color("salbeiGrun"))
        }
    }
}


struct FloatingActionButton: View {
    let action: () -> Void
    @State private var isRotating = false
    
    var body: some View {
        Button(action: {
            withAnimation {
                isRotating.toggle()
            }
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isRotating.toggle()
            }
        }) {
            Image(systemName: "arrow.clockwise")
                .font(.title)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .frame(width: 60, height: 60)
                .background(Color.dunkelGelb)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
        }
        .padding()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
