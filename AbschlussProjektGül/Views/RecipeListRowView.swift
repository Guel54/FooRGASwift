import SwiftUI

struct RecipeListRowView: View {
    var meal: Meal
    @State private var isLoading = true
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Bild mit Favoriten-Button
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
                            // Überlagerung mit abgerundeten Ecken
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
                                    .offset(x: -1, y: -100)
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
    
    private func setFavorite(for meal: Meal) {
        meal.isFavorite.toggle()
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
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
