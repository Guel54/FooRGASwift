

import SwiftUI
import SwiftData

struct AppNavigation: View {
    @EnvironmentObject var weekPlannerViewModel: WeekPlannerViewModel
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Favorite", systemImage: "heart") {
                FavoriteView()
            }
            
            Tab("Wochenplaner", systemImage: "calendar") {
                WeekPlannerView()
                    .environmentObject(weekPlannerViewModel)
            }
            
            Tab("Add Recipe", systemImage: "plus.circle") {
                AddRecipeView()
                
            }
            
            Tab("Settings", systemImage: "wrench") {
                ProfileView()
            }
        }
        .onAppear {
            // Hintergrundfarbe der Tab-Leiste
            UITabBar.appearance().backgroundColor = UIColor(Color("salbeiGrun"))
            // Farbe für inaktive Tabs
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color("dunkelGrun"))
            // Farbe für aktive Tabs
            UITabBar.appearance().tintColor = UIColor(Color("dunkelGelb"))
        }
        .background(Color("dunkelGrun").edgesIgnoringSafeArea(.all)) // Allgemeiner Hintergrund
        .accentColor(Color("dunkelGelb")) // Aktive Tab-Farbe in SwiftUI
    }
}



#Preview {
    AppNavigation()
        .environmentObject(WeekPlannerViewModel())
    
}
