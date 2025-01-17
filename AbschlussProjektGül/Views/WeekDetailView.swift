


import SwiftUI

struct WeekDetailView: View {
    let weekPlan: WeekPlan // Einzelner Wochenplan-Eintrag
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Rezeptbild
                if let imageUrl = weekPlan.meal?.image, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                    }
                }

                // Rezeptdetails
                VStack(alignment: .leading, spacing: 8) {
                    Text(weekPlan.meal?.name ?? "Kein Rezept")
                        .font(.title)
                        .fontWeight(.bold)

                    if let description = weekPlan.meal?.beschreibung {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Rezeptdetails")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Zurück") {
                        dismiss()
                    }
                }
            }
        }
    }
}
