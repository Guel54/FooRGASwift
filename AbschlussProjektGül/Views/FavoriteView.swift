import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Query(filter: #Predicate<Meal> {$0.isFavorite}, sort: \Meal.name, order: .forward) private var meals: [Meal]
    
    @Environment(\.modelContext) private var modelContext
    @State private var showErrorAlert = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(meals) { meal in
                    // NavigationLink für die Detailansicht
                    NavigationLink(destination: FavoriteDetailView(meal: meal)) {
                        HStack {
                            AsyncImage(url: URL(string: meal.image)) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                            }

                            Text(meal.name)
                                .font(.headline)
                                .padding(.leading, 8)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete(perform: deleteMeal)
            }
            .navigationTitle("Favoriten")
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Fehler"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func setFavorite(for meal: Meal) {
        meal.isFavorite.toggle()
        do {
            try modelContext.save()
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }
    
    private func deleteMeal(at offsets: IndexSet) {
        for index in offsets {
            let meal = meals[index]
            modelContext.delete(meal)
        }
        do {
            try modelContext.save()
        } catch {
            print("Error: \(error)")
        }
    }
}


#Preview {
    FavoriteView()
        .modelContainer(for: [
            Meal.self,
        ], inMemory: true)
}
