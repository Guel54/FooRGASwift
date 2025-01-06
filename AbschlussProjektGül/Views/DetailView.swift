import SwiftUI

struct DetailView: View {
    var meal: Meal // Die Mahlzeit wird als Parameter übergeben
    
    init(meal: Meal) {
        self.meal = meal
        // Konfiguration der NavigationBar-Appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color("dunkelGrün"))] // Setzt die Titel-Farbe
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            Color("Salbeigrün")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    // Bild der Mahlzeit
                    AsyncImage(url: URL(string: meal.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 398)
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
                    VStack(alignment:.listRowSeparatorLeading, spacing: 8) {
                        Text("Zutaten:")
                            .foregroundColor(.primary)
                            .bold()
                            .shadow(radius: 10)
                            .padding(.bottom, 2)
                        
                        // Zutaten anzeigen...
                    }
                    .padding(.horizontal, 16)
                    
                    Text(meal.beschreibung ?? "Keine Beschreibung verfügbar.")
                        .font(.body)
                        .padding(.top, 8)
                        .padding(.horizontal, 16)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
            .navigationBarTitle(Text(meal.name), displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel für eine Mahlzeit zur Vorschau
        DetailView(meal: Meal(id: "123", name: "Spaghetti Carbonara", image: "https://example.com/spaghetti.jpg", beschreibung: "Leckere Spaghetti mit einer cremigen Carbonara-Sauce."))
    }
}
