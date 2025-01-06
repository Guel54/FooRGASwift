import SwiftUI
import SwiftData
import Foundation

struct WeekPlannerView: View {
    @EnvironmentObject var weekPlannerViewModel: WeekPlannerViewModel
    @State private var selectedMeal: Meal?
    @State private var isSelectingRecipe = false
    @State private var selectedDates: Set<DateComponents> = []
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                MultiDatePicker(
                    "Wähle Tage",
                    selection: $selectedDates
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .background(Color(UIColor(named: "Salbeigrün") ?? .green)) // Salbeigrün-Hintergrund
                .cornerRadius(10)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.dunkelGrün, lineWidth: 2) // Randfarbe
                )
                .tint(Color.dunkelGrün) // Setzt die grünen Navigationselemente
                .padding()
                
                List {
                    ForEach(weekPlannerViewModel.weekPlan) { weekPlan in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(formatDate(weekPlan.date))
                                    .font(.headline)
                                    .foregroundColor(Color.olivegrün)
                                Text(weekPlan.day)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Text(weekPlan.meal?.name ?? "Kein Rezept")
                                .font(.subheadline)
                                .foregroundColor(weekPlan.meal == nil ? .gray : .primary)
                            
                            Button("Ändern") {
                                selectedMeal = nil
                                isSelectingRecipe = true
                            }
                            .padding(5)
                            .background(Color.dunkelGelb)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.vertical, 8)
                        .swipeActions {
                            Button(role: .destructive) {
                                weekPlannerViewModel.deleteWeekPlan(weekPlan)
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                        }
                    }
                }
                .navigationTitle("Wochenplaner")
                .foregroundColor(Color.dunkelGrün)
                
                if !selectedDates.isEmpty {
                    Button("Mahlzeit auswählen") {
                        isSelectingRecipe = true
                    }
                    .padding()
                    .background(
                     LinearGradient(gradient: Gradient(colors: [Color.dunkelGrün, Color.olivegrün, Color.salbeigrün]), startPoint: .leading, endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
            }
            .sheet(isPresented: $isSelectingRecipe) {
                WeekMealSelectionView { meal in
                    if let meal = meal {
                        // Hinzufügen der Mahlzeit für jedes ausgewählte Datum
                        for dateComponents in selectedDates {
                            if let date = Calendar.current.date(from: dateComponents) {
                                // Setze Uhrzeit auf Mitternacht, falls nicht gewünscht
                                var calendarDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: date)!
                                weekPlannerViewModel.addMealToDate(meal: meal, date: calendarDate)
                            }
                        }
                        // Leeren der ausgewählten Tage
                        selectedDates.removeAll()
                    }
                }
            }
        }
    }
    
    // Formatierung der Datumsanzeige
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "de_DE")
        return formatter.string(from: date)
    }
}
