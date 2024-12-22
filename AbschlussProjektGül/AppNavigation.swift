//
//  AppNavigation.swift
//  ProjektWoche2
//
//  Created by Gül Köse on 26.11.24.
//


import SwiftUI
import SwiftData

struct AppNavigation: View {
    
    
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
                    
            }
            
            Tab("Add Recipe", systemImage: "plus.circle") {
                AddRecipeView()
                    
            }
            
            Tab("Settings", systemImage: "wrench") {
                SettingsView()
            }
            
        }
    }
}

#Preview {
    AppNavigation()
        
    
}
