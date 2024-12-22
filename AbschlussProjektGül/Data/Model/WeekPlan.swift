import SwiftUI
import SwiftData
import Foundation

@Model
class WeekPlan: Identifiable {
        var id = UUID()  
        var day: String
        var date: Date
        var meal: Meal?
        
        
        init(id: UUID = UUID(), day: String, date: Date, meal: Meal? = nil) {
            self.id = id
            self.day = day
            self.date = date
            self.meal = meal
        }
    }

import Foundation

// Modell für den Wochenplan
class WeeklyPlan: ObservableObject {
    @Published var days: [String: [Meal]] = [
        "Montag": [],
        "Dienstag": [],
        "Mittwoch": [],
        "Donnerstag": [],
        "Freitag": [],
        "Samstag": [],
        "Sonntag": []
    ]
}
