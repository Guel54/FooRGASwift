//
//  AppNavigation.swift
//  AbschlussProjektGül
//
//  Created by Gül Köse on 18.12.24.
//

import SwiftUI

struct AppNavigation: View {
    //@ObservedObject var addRecipeViewModel: AddRecipeViewModel
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                //HomeView()
            }
            Tab("Favorite", systemImage: "heart") {
                //FavoriteView()
            }
            Tab("Add Recipe", systemImage: "plus.circle") {
                //AddRecipeView()
                    //.environmentObject(addRecipeViewModel)  // Hier wird das addRecipeViewModel übergeben
            }
            
            Tab("Settings", systemImage: "wrench") {
                //SettingsView()
            }
           
        }
    }
}

#Preview {
    AppNavigation()//addRecipeViewModel: AddRecipeViewModel()
}
