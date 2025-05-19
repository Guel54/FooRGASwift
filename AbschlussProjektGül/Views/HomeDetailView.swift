import SwiftUI

struct HomeDetailView: View {
    var meal: Meal // Die Mahlzeit wird als Parameter übergeben
    
    init(meal: Meal) {
        self.meal = meal
        // Konfiguration der NavigationBar-Appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color("dunkelGrun"))] // Setzt die Titel-Farbe
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            // Hintergrundfarbe
            Color("salbeiGrun")
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
                    
                    // YouTube Button
                    if let youtubeURL = meal.strYoutube, !youtubeURL.isEmpty {
                        Link(destination: URL(string: youtubeURL)!) {
                            HStack {
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.largeTitle)
                            }
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        .padding(.bottom, 10)
                    }
                }
                    
                    
                    // Zutatenliste mit Mengenangaben
                    
                    VStack(alignment: .leading) {
                        Text("Zutaten:")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(.leading, 10)
                            .padding(.bottom, 9)
                        
                        HStack(alignment: .top, spacing: 16) {
                            // Spalte mit den Zutaten
                            VStack(alignment: .leading, spacing: 5) {
                                if let ingredient1 = meal.ingredient1, !ingredient1.isEmpty {
                                    Text(ingredient1)
                                }
                                if let ingredient2 = meal.ingredient2, !ingredient2.isEmpty {
                                    Text(ingredient2)
                                }
                                if let ingredient3 = meal.ingredient3, !ingredient3.isEmpty {
                                    Text(ingredient3)
                                }
                                if let ingredient4 = meal.ingredient4, !ingredient4.isEmpty {
                                    Text(ingredient4)
                                }
                                if let ingredient5 = meal.ingredient5, !ingredient5.isEmpty {
                                    Text(ingredient5)
                                }
                                if let ingredient6 = meal.ingredient6, !ingredient6.isEmpty {
                                    Text(ingredient6)
                                }
                                if let ingredient7 = meal.ingredient7, !ingredient7.isEmpty {
                                    Text(ingredient7)
                                }
                                if let ingredient8 = meal.ingredient8, !ingredient8.isEmpty {
                                    Text(ingredient8)
                                }
                                if let ingredient9 = meal.ingredient9, !ingredient9.isEmpty {
                                    Text(ingredient9)
                                }
                                if let ingredient10 = meal.ingredient10, !ingredient10.isEmpty {
                                    Text(ingredient10)
                                }
                                if let ingredient11 = meal.ingredient11, !ingredient11.isEmpty {
                                    Text(ingredient11)
                                }
                                if let ingredient12 = meal.ingredient12, !ingredient12.isEmpty {
                                    Text(ingredient12)
                                }
                                if let ingredient13 = meal.ingredient13, !ingredient13.isEmpty {
                                    Text(ingredient13)
                                }
                                if let ingredient14 = meal.ingredient14, !ingredient14.isEmpty {
                                    Text(ingredient14)
                                }
                                if let ingredient15 = meal.ingredient15, !ingredient15.isEmpty {
                                    Text(ingredient15)
                                }
                                if let ingredient16 = meal.ingredient16, !ingredient16.isEmpty {
                                    Text(ingredient16)
                                }
                                if let ingredient17 = meal.ingredient17, !ingredient17.isEmpty {
                                    Text(ingredient17)
                                }
                                if let ingredient18 = meal.ingredient18, !ingredient18.isEmpty {
                                    Text(ingredient18)
                                }
                                if let ingredient19 = meal.ingredient19, !ingredient19.isEmpty {
                                    Text(ingredient19)
                                }
                                if let ingredient20 = meal.ingredient20, !ingredient20.isEmpty {
                                    Text(ingredient20)
                                }
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        
                        // Beschreibung der Mahlzeit
                        Text(meal.beschreibung)
                            .font(.body)
                            .padding(.top, 8)
                            .padding(.horizontal, 20)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                }
                .navigationBarTitle(Text(meal.name), displayMode: .inline)
            }
        }
    }

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView(meal: Meal(id: "123", name: "Spaghetti Carbonara", image: "https://example.com/spaghetti.jpg", beschreibung: "Leckere Spaghetti mit einer cremigen Carbonara-Sauce.", strYoutube: ""))
    }
}
