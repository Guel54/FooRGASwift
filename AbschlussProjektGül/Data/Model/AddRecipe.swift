//
//  AddRecipe.swift
//  Test123
//
//  Created by Gül Köse on 14.12.24.
//


///mit User ID brauche ich den code hier
//struct AddRecipe: Identifiable, Codable {
//    @DocumentID var id: String? // Firebase Firestore ID
//    var userId: String
//    var title: String
//    var description: String
//    var imageURL: String? // Optionales Bild-URL-Feld
//
//}



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
