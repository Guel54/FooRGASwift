import SwiftUI
import SwiftData

struct RecipeListRowView: View {
    var meal: Meal
    @State private var isLoading = true
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var weekPlannerViewModel: WeekPlannerViewModel
    @State private var isAddingToWeekPlanner = false

    var body: some View {
        VStack(spacing: 16) {
            // Bild mit Favoriten-Button und Kalender-Button
            if isLoading {
                ProgressView()
                    .frame(height: 250)
                    .cornerRadius(20)
                    .padding(.horizontal)
            } else {
                AsyncImage(url: URL(string: meal.image)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .cornerRadius(20)
                        .clipped()
                        .overlay {
                            ZStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        setFavorite(for: meal)
                                    } label: {
                                        Image(systemName: meal.isFavorite ? "heart.fill" : "heart")
                                            .font(.system(size: 30))
                                            .foregroundColor(.red)
                                            .padding(10)
                                            .background(Color.white.opacity(0.6))
                                            .clipShape(Circle())
                                    }
                                    .offset(x: 150, y: -90)

                                    Spacer()
                                    Button {
                                        // Übergebe hier nur das `meal` und `date`
                                        weekPlannerViewModel.addMealToDate(meal: meal, date: Date())
                                    } label: {
                                        Image(systemName: "calendar.badge.plus")
                                            .font(.system(size: 30))
                                            .foregroundColor(.blue)
                                            .padding(10)
                                            .background(Color.white.opacity(0.6))
                                            .clipShape(Circle())
                                    }
                                    .offset(x: -5, y: -30)
                                }
                            }
                        }
                    Text(meal.name)
                        .font(.title2)
                        .foregroundColor(.black)
                        .bold()
                        .shadow(radius: 10)
                        .padding(.horizontal)
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .padding(.horizontal)
        .onAppear {
            isLoading = false
        }
    }

    // Funktion zum Setzen des Favoritenstatus
    private func setFavorite(for meal: Meal) {
        guard meal.isFavorite != !meal.isFavorite else { return } // Keine Aktion, wenn sich der Status nicht ändert
        meal.isFavorite.toggle()
        
        // Nur speichern, wenn sich der Status geändert hat
        modelContext.insert(meal)
        do {
            try modelContext.save()
        } catch {
            print("Error saving favorite state: \(error)")
        }
    }
}

struct RecipeListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListRowView(meal: Meal(
            id: "1",
            name: "Pizza",
            image: "https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg",
            beschreibung: "Ein leckeres italienisches Gericht mit Tomatensauce, Käse und verschiedenen Toppings!",
            ingredient1: "Mehl",
            ingredient2: "Wasser",
            ingredient3: "Hefe",
            ingredient4: "Tomatensauce",
            ingredient5: "Käse"
        ))
        .environmentObject(WeekPlannerViewModel()) // Beispiel für die Vorschau mit dem ViewModel
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
