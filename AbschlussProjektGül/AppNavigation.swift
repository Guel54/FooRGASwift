

import SwiftUI
import SwiftData

struct AppNavigation: View {
    @EnvironmentObject var weekPlannerViewModel: WeekPlannerViewModel
    
    var body: some View {
        TabView {
            Tab("Start", systemImage: "house") {
                StartView()
            }
            
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
    }
}

#Preview {
    AppNavigation()
        .environmentObject(WeekPlannerViewModel())

}
