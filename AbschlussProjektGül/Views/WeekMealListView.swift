import SwiftUI

struct WeekMealListView: View {
    @Binding var selectedMeal: Meal? // Binding für die ausgewählte Mahlzeit
    @State private var meals: [Meal] = [] // Beispielhafte Mahlzeitenliste

    var body: some View {
        NavigationView {
            List(meals) { meal in
                HStack {
                    // Asynchrones Laden von Bildern (falls URL verwendet wird)
                    AsyncImage(url: URL(string: meal.image)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle()) // Optional: Runde Bilder
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .frame(width: 50, height: 50)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(meal.name) // Name der Mahlzeit
                            .font(.headline)
                        Text(meal.beschreibung) // Beschreibung der Mahlzeit
                            .font(.subheadline)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        toggleFavorite(for: meal)
                    }) {
                        Image(systemName: meal.isFavorite ? "star.fill" : "star")
                            .foregroundColor(meal.isFavorite ? .yellow : .gray)
                    }
                    .buttonStyle(PlainButtonStyle()) // Optional: Verhindert den Standard Button Stil
                }
                .padding(.vertical, 8) // Abstand innerhalb der Zelle
                .onTapGesture {
                    selectMeal(meal) // Mahlzeit auswählen
                }
            }
            .navigationTitle("Mahlzeiten")
            .onAppear {
                loadMeals() // Mahlzeiten laden
            }
        }
    }

    // Beispielhafte Funktion zum Laden der Mahlzeiten
    func loadMeals() {
        meals = [
            Meal(id: "1", name: "Spaghetti Bolognese", image: "https://example.com/spaghetti.jpg", beschreibung: "Leckere Pasta mit Tomatensauce und Hackfleisch", isFavorite: false),
            Meal(id: "2", name: "Pizza Margherita", image: "https://example.com/pizza.jpg", beschreibung: "Klassische Pizza mit Tomaten und Mozzarella", isFavorite: true),
            Meal(id: "3", name: "Caesar Salad", image: "https://example.com/salad.jpg", beschreibung: "Frischer Salat mit Caesar-Dressing", isFavorite: false)
        ]
    }

    // Funktion zum Auswählen einer Mahlzeit
    private func selectMeal(_ meal: Meal) {
        selectedMeal = meal // Setzen der ausgewählten Mahlzeit
        // Hier können Sie die Logik hinzufügen, um die Ansicht zu schließen
    }

    // Funktion zum Umschalten des Favoritenstatus
    func toggleFavorite(for meal: Meal) {
        if let index = meals.firstIndex(where: { $0.id == meal.id }) {
            meals[index].isFavorite.toggle() // Favoritenstatus umschalten
        }
    }
}

struct WeekMealListView_Previews: PreviewProvider {
    static var previews: some View {
        WeekMealListView(selectedMeal: .constant(nil))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
