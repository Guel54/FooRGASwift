//
//  AbschlussProjektGu_lApp.swift
//  AbschlussProjektGül
//
//  Created by Gül Köse on 12.12.24.
//

import SwiftUI
import FirebaseCore
import SwiftData


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
@main
struct AbschlussProjektGu_lApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @StateObject private var recipeViewModel = RecipeViewModel()
    @StateObject private var addRecipeViewModel = AddRecipeViewModel()
    @StateObject private var weekPlannerViewModel = WeekPlannerViewModel()
    
    var body: some Scene {
        WindowGroup {
           
            AppNavigation()
                .modelContainer(for: [WeekPlan.self], inMemory: true)
            .environmentObject(recipeViewModel)
            .environmentObject(addRecipeViewModel)
            .environmentObject(weekPlannerViewModel)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
