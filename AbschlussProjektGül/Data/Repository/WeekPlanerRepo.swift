
import SwiftData
import SwiftUI



class WeekPlannerRepository {

    @Environment(\.modelContext) private var context
    
    // Holt Mahlzeiten für einen bestimmten Tag und speichert sie in SwiftData
    func fetchMeals(forDay day: String) async throws -> [Meal] {
        let urlString = "https://api.example.com/meals?day=\(day)"
        guard let url = URL(string: urlString) else { throw HTTPError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(MealResponse.self, from: data)

        var meals: [Meal] = []
        if let fetchedMeals = result.meals {
            meals = fetchedMeals.map { meal in
                return Meal(
                    id: meal.id,
                    name: meal.name,
                    image: meal.image,
                    beschreibung: meal.beschreibung,
                    isFavorite: meal.isFavorite,
                    ingredient1: meal.ingredient1,
                    ingredient2: meal.ingredient2,
                    ingredient3: meal.ingredient3,
                    ingredient4: meal.ingredient4,
                    ingredient5: meal.ingredient5,
                    ingredient6: meal.ingredient6,
                    ingredient7: meal.ingredient7,
                    ingredient8: meal.ingredient8,
                    ingredient9: meal.ingredient9,
                    ingredient10: meal.ingredient10,
                    ingredient11: meal.ingredient11,
                    ingredient12: meal.ingredient12,
                    ingredient13: meal.ingredient13,
                    ingredient14: meal.ingredient14,
                    ingredient15: meal.ingredient15,
                    ingredient16: meal.strMeasure16,
                    ingredient17: meal.strMeasure17,
                    ingredient18: meal.strMeasure18,
                    ingredient19: meal.strMeasure19,
                    ingredient20: meal.strMeasure20
                )
            }
        }

        // Speichern der Mahlzeiten in SwiftData
        for meal in meals {
            context.insert(meal)
        }
        try context.save() // Speichern
        
        return meals
    }

    // Holt Mahlzeiten für die ganze Woche
    func fetchMealsForWeek() async throws -> [String: [Meal]] {
        let daysOfWeek = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"]
        var weekMeals: [String: [Meal]] = [:]

        // Für jeden Tag der Woche Mahlzeiten abrufen
        for day in daysOfWeek {
            do {
                let meals = try await fetchMeals(forDay: day)
                weekMeals[day] = meals
            } catch {
                print("Fehler beim Abrufen der Mahlzeiten für \(day): \(error)")
                weekMeals[day] = []
            }
        }
        return weekMeals
    }

    // Neue Methode: Holt alle Wochenpläne (optional, je nach deinem Bedarf)
    func fetchWeekPlans() async throws -> [WeekPlan] {
        var weekPlans: [WeekPlan] = []

        for day in ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"] {
            let meal = try await fetchMeals(forDay: day) // Hole Mahlzeiten für den Tag
            
            // Assuming WeekPlan accepts an array of meals, otherwise adjust accordingly.
            let plan = WeekPlan(day: day, date: Date(), meal: meal.first) // Use first meal or adjust for array
            weekPlans.append(plan)
        }

        return weekPlans
    }

}
