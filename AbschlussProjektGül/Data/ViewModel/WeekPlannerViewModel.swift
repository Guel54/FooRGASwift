import SwiftUI
import SwiftData

@MainActor
class WeekPlannerViewModel: ObservableObject {
    @Published var weekPlan: [WeekPlan] = []
    private let repository: WeekPlannerRepository = WeekPlannerRepository()

    // Initializer zum Laden der Wochenpläne
    init() {
        loadWeekPlans()
    }

    // Laden der Wochenpläne
    private func loadWeekPlans() {
        Task {
            do {
                let plans = try await repository.fetchWeekPlans()
                weekPlan = plans
            } catch {
                print("Fehler beim Laden der Wochenpläne: \(error)")
            }
        }
    }

    // Methode zum Hinzufügen einer Mahlzeit für ein bestimmtes Datum
    func addMealToDate(meal: Meal, date: Date) {
        let day = getDayOfWeek(for: date)

        // Prüfe, ob bereits ein Plan für dieses Datum existiert
        if let existingPlanIndex = weekPlan.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            // Aktualisiere den bestehenden Plan
            weekPlan[existingPlanIndex].meal = meal
        } else {
            // Erstelle einen neuen Plan
            let newWeekPlan = WeekPlan(day: day, date: date, meal: meal)
            weekPlan.append(newWeekPlan)
        }

        // Sortiere die Pläne nach Datum
        weekPlan.sort { $0.date < $1.date }
    }

    // Methode zum Löschen eines Wochenplans
    func deleteWeekPlan(_ plan: WeekPlan) {
        if let index = weekPlan.firstIndex(where: { $0.id == plan.id }) {
            weekPlan.remove(at: index)
        }
    }

    // Hilfsfunktion zum Berechnen des Wochentags
    private func getDayOfWeek(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "de_DE") // Deutscher Wochentag
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}
