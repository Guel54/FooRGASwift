



import Foundation
import FirebaseFirestore


struct AddRecipe: Codable, Identifiable {
    @DocumentID var id: String? // Firestore ID
    var userId: String          // Verknüpft mit anonymem Nutzer
    var title: String
    var description: String
    var cookTime: String        // Neue Eigenschaft für Kochzeit
    var ingredients: [String]   // Neue Eigenschaft für Zutaten

    init(id: String? = nil, userId: String, title: String, description: String, cookTime: String, ingredients: [String]) {
        self.id = id
        self.userId = userId
        self.title = title
        self.description = description
        self.cookTime = cookTime
        self.ingredients = ingredients
    }
}
