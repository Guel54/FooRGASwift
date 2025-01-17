import SwiftUI

struct FavoriteDetailView: View {
    let meal: Meal
    
    var body: some View {
        ZStack {
            // Hintergrundfarbe
            Color("Salbeigrün")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Bild der Mahlzeit
                    AsyncImage(url: URL(string: meal.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 380)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                    }
                    
                    // Titel der Mahlzeit
                    Text(meal.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("dunkelGelb"))
                        .padding(.top, 1)
                    
                    // Zutatenliste mit Mengenangaben
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Zutaten:")
                            .foregroundColor(.primary)
                            .bold()
                            .padding(.bottom, 2)
                        
                        Group {
                            if let ingredient1 = meal.ingredient1, !ingredient1.isEmpty {
                                Text("\(ingredient1) - \(meal.strMeasure1 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient2 = meal.ingredient2, !ingredient2.isEmpty {
                                Text("\(ingredient2) - \(meal.strMeasure2 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient3 = meal.ingredient3, !ingredient3.isEmpty {
                                Text("\(ingredient3) - \(meal.strMeasure3 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient4 = meal.ingredient4, !ingredient4.isEmpty {
                                Text("\(ingredient4) - \(meal.strMeasure4 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient5 = meal.ingredient5, !ingredient5.isEmpty {
                                Text("\(ingredient5) - \(meal.strMeasure5 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient6 = meal.ingredient6, !ingredient6.isEmpty {
                                Text("\(ingredient6) - \(meal.strMeasure6 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient7 = meal.ingredient7, !ingredient7.isEmpty {
                                Text("\(ingredient7) - \(meal.strMeasure7 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient8 = meal.ingredient8, !ingredient8.isEmpty {
                                Text("\(ingredient8) - \(meal.strMeasure8 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient9 = meal.ingredient9, !ingredient9.isEmpty {
                                Text("\(ingredient9) - \(meal.strMeasure9 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient10 = meal.ingredient10, !ingredient10.isEmpty {
                                Text("\(ingredient10) - \(meal.strMeasure10 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient11 = meal.ingredient11, !ingredient11.isEmpty {
                                Text("\(ingredient11) - \(meal.strMeasure11 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient12 = meal.ingredient12, !ingredient12.isEmpty {
                                Text("\(ingredient12) - \(meal.strMeasure12 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient13 = meal.ingredient13, !ingredient13.isEmpty {
                                Text("\(ingredient13) - \(meal.strMeasure13 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient14 = meal.ingredient14, !ingredient14.isEmpty {
                                Text("\(ingredient14) - \(meal.strMeasure14 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient15 = meal.ingredient15, !ingredient15.isEmpty {
                                Text("\(ingredient15) - \(meal.strMeasure15 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient16 = meal.ingredient16, !ingredient16.isEmpty {
                                Text("\(ingredient16) - \(meal.strMeasure16 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient17 = meal.ingredient17, !ingredient17.isEmpty {
                                Text("\(ingredient17) - \(meal.strMeasure17 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient18 = meal.ingredient18, !ingredient18.isEmpty {
                                Text("\(ingredient18) - \(meal.strMeasure18 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient19 = meal.ingredient19, !ingredient19.isEmpty {
                                Text("\(ingredient19) - \(meal.strMeasure19 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            if let ingredient20 = meal.ingredient20, !ingredient20.isEmpty {
                                Text("\(ingredient20) - \(meal.strMeasure20 ?? "")")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                    .padding(.vertical, 4)
                            }
                            
                        }
                        .padding(.horizontal, 16)
                        
                        // Beschreibung der Mahlzeit
                        Text(meal.beschreibung)
                            .font(.body)
                            .padding(.top, 8)
                            .padding(.horizontal, 16)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                }
            }
            .navigationBarTitle(Text(meal.name), displayMode: .inline)
            
        }
    }
}
#Preview {
    FavoriteDetailView(meal: Meal(id: "123", name: "Spaghetti Carbonara", image: "https://example.com/spaghetti.jpg", beschreibung: "Leckere Spaghetti mit einer cremigen Carbonara-Sauce."))
}
