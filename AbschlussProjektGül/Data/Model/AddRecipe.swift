


import Foundation
import FirebaseFirestore


struct AddRecipe: Codable, Identifiable {
    @DocumentID var id: String? // Firestore ID
    var userId: String          // Verknüpft mit anonymem Nutzer
    var title: String
    var description: String
    

    init(id: String? = nil, userId: String, title: String, description: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.description = description
    }
}
