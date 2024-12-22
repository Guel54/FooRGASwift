import SwiftUI
import SwiftData

struct WeekMealSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query private var meals: [Meal]

    var onMealSelected: (Meal?) -> Void

    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView("Lade Mahlzeiten...")
                        .padding()
                } else {
                    List(meals) { meal in
                        Button(action: {
                            onMealSelected(meal)
                            dismiss()
                        }) {
                            HStack {
                                // Asynchronous Bilddarstellung
                                AsyncImage(url: URL(string: meal.image)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                        .progressViewStyle(CircularProgressViewStyle())
                                }
                                
                                // Mahlzeitname
                                Text(meal.name)
                                    .font(.headline)
                                    .padding(.leading, 8)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(PlainListStyle()) // Verwenden von PlainListStyle für einfachere Darstellung
                }
            }
            .navigationTitle("Mahlzeiten auswählen")
            .onAppear {
                isLoading = true
                // Optionale Ladezeit, um zu simulieren, dass Daten geladen werden
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }
        }
    }
}
