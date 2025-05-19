


import SwiftUI
import SwiftData


struct MealResponse: Codable {
    var meals: [Meal]?
}

@Model
class Meal: Identifiable, Codable {
    var id: String
    var name: String
    var image: String
    var beschreibung: String
    var isFavorite: Bool
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    var strYoutube: String?
    
    init(
        id: String,
        name: String,
        image: String,
        beschreibung: String,
        isFavorite: Bool = false,
        ingredient1: String? = nil,
        ingredient2: String? = nil,
        ingredient3: String? = nil,
        ingredient4: String? = nil,
        ingredient5: String? = nil,
        ingredient6: String? = nil,
        ingredient7: String? = nil,
        ingredient8: String? = nil,
        ingredient9: String? = nil,
        ingredient10: String? = nil,
        ingredient11: String? = nil,
        ingredient12: String? = nil,
        ingredient13: String? = nil,
        ingredient14: String? = nil,
        ingredient15: String? = nil,
        ingredient16: String? = nil,
        ingredient17: String? = nil,
        ingredient18: String? = nil,
        ingredient19: String? = nil,
        ingredient20: String? = nil,
        
        
        strMeasure1: String? = nil,
        strMeasure2: String? = nil,
        strMeasure3: String? = nil,
        strMeasure4: String? = nil,
        strMeasure5: String? = nil,
        strMeasure6: String? = nil,
        strMeasure7: String? = nil,
        strMeasure8: String? = nil,
        strMeasure9: String? = nil,
        strMeasure10: String? = nil,
        strMeasure11: String? = nil,
        strMeasure12: String? = nil,
        strMeasure13: String? = nil,
        strMeasure14: String? = nil,
        strMeasure15: String? = nil,
        strMeasure16: String? = nil,
        strMeasure17: String? = nil,
        strMeasure18: String? = nil,
        strMeasure19: String? = nil,
        strMeasure20: String? = nil,
        strYoutube: String
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.beschreibung = beschreibung
        self.isFavorite = isFavorite
        self.ingredient1 = ingredient1
        self.ingredient2 = ingredient2
        self.ingredient3 = ingredient3
        self.ingredient4 = ingredient4
        self.ingredient5 = ingredient5
        self.ingredient6 = ingredient6
        self.ingredient7 = ingredient7
        self.ingredient8 = ingredient8
        self.ingredient9 = ingredient9
        self.ingredient10 = ingredient10
        self.ingredient11 = ingredient11
        self.ingredient12 = ingredient12
        self.ingredient13 = ingredient13
        self.ingredient14 = ingredient14
        self.ingredient15 = ingredient15
        self.ingredient16 = ingredient16
        self.ingredient17 = ingredient17
        self.ingredient18 = ingredient18
        self.ingredient19 = ingredient19
        self.ingredient20 = ingredient20
        
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strMeasure16 = strMeasure16
        self.strMeasure17 = strMeasure17
        self.strMeasure18 = strMeasure18
        self.strMeasure19 = strMeasure19
        self.strMeasure20 = strMeasure20
    }
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case image = "strMealThumb"
        case beschreibung = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strMeasure16 = "strMeasure16"
        case strMeasure17 = "strMeasure17"
        case strMeasure18 = "strMeasure18"
        case strMeasure19 = "strMeasure19"
        case strMeasure20 = "strMeasure20"
        
        case isFavorite
        case strYoutube
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.beschreibung = try container.decode(String.self, forKey: .beschreibung)
        self.isFavorite = (try? container.decode(Bool.self, forKey: .isFavorite)) ?? false
        self.ingredient1 = try? container.decode(String.self, forKey: .ingredient1)
        self.ingredient2 = try? container.decode(String.self, forKey: .ingredient2)
        self.ingredient3 = try? container.decode(String.self, forKey: .ingredient3)
        self.ingredient4 = try? container.decode(String.self, forKey: .ingredient4)
        self.ingredient5 = try? container.decode(String.self, forKey: .ingredient5)
        self.ingredient6 = try? container.decode(String.self, forKey: .ingredient6)
        self.ingredient7 = try? container.decode(String.self, forKey: .ingredient7)
        self.ingredient8 = try? container.decode(String.self, forKey: .ingredient8)
        self.ingredient9 = try? container.decode(String.self, forKey: .ingredient9)
        self.ingredient10 = try? container.decode(String.self, forKey: .ingredient10)
        self.ingredient11 = try? container.decode(String.self, forKey: .ingredient11)
        self.ingredient12 = try? container.decode(String.self, forKey: .ingredient12)
        self.ingredient13 = try? container.decode(String.self, forKey: .ingredient13)
        self.ingredient14 = try? container.decode(String.self, forKey: .ingredient14)
        self.ingredient15 = try? container.decode(String.self, forKey: .ingredient15)
        self.ingredient16 = try? container.decode(String.self, forKey: .ingredient16)
        self.ingredient17 = try? container.decode(String.self, forKey: .ingredient17)
        self.ingredient18 = try? container.decode(String.self, forKey: .ingredient18)
        self.ingredient19 = try? container.decode(String.self, forKey: .ingredient19)
        self.ingredient20 = try? container.decode(String.self, forKey: .ingredient20)
        
        
        self.strMeasure1 = try? container.decode(String.self, forKey: .strMeasure1)
        self.strMeasure2 = try? container.decode(String.self, forKey: .strMeasure2)
        self.strMeasure3 = try? container.decode(String.self, forKey: .strMeasure3)
        self.strMeasure4 = try? container.decode(String.self, forKey: .strMeasure4)
        self.strMeasure5 = try? container.decode(String.self, forKey: .strMeasure5)
        self.strMeasure6 = try? container.decode(String.self, forKey: .strMeasure6)
        self.strMeasure7 = try? container.decode(String.self, forKey: .strMeasure7)
        self.strMeasure8 = try? container.decode(String.self, forKey: .strMeasure8)
        self.strMeasure9 = try? container.decode(String.self, forKey: .strMeasure9)
        self.strMeasure10 = try? container.decode(String.self, forKey: .strMeasure10)
        self.strMeasure11 = try? container.decode(String.self, forKey: .strMeasure11)
        self.strMeasure12 = try? container.decode(String.self, forKey: .strMeasure12)
        self.strMeasure13 = try? container.decode(String.self, forKey: .strMeasure13)
        self.strMeasure14 = try? container.decode(String.self, forKey: .strMeasure14)
        self.strMeasure15 = try? container.decode(String.self, forKey: .strMeasure15)
        self.strMeasure16 = try? container.decode(String.self, forKey: .strMeasure16)
        self.strMeasure17 = try? container.decode(String.self, forKey: .strMeasure17)
        self.strMeasure18 = try? container.decode(String.self, forKey: .strMeasure18)
        self.strMeasure19 = try? container.decode(String.self, forKey: .strMeasure19)
        self.strMeasure20 = try? container.decode(String.self, forKey: .strMeasure20)
        self.strYoutube = try? container.decode(String.self, forKey: .strYoutube)
        
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(image, forKey: .image)
        try container.encode(beschreibung, forKey: .beschreibung)
        try? container.encode(isFavorite, forKey: .isFavorite)
        try? container.encode(ingredient1, forKey: .ingredient1)
        try? container.encode(ingredient2, forKey: .ingredient2)
        try? container.encode(ingredient3, forKey: .ingredient3)
        try? container.encode(ingredient4, forKey: .ingredient4)
        try? container.encode(ingredient5, forKey: .ingredient5)
        try? container.encode(ingredient6, forKey: .ingredient6)
        try? container.encode(ingredient7, forKey: .ingredient7)
        try? container.encode(ingredient8, forKey: .ingredient8)
        try? container.encode(ingredient9, forKey: .ingredient9)
        try? container.encode(ingredient10, forKey: .ingredient10)
        try? container.encode(ingredient11, forKey: .ingredient11)
        try? container.encode(ingredient12, forKey: .ingredient12)
        try? container.encode(ingredient13, forKey: .ingredient13)
        try? container.encode(ingredient14, forKey: .ingredient14)
        try? container.encode(ingredient15, forKey: .ingredient15)
        try? container.encode(ingredient16, forKey: .ingredient16)
        try? container.encode(ingredient17, forKey: .ingredient17)
        try? container.encode(ingredient18, forKey: .ingredient18)
        try? container.encode(ingredient19, forKey: .ingredient19)
        try? container.encode(ingredient20, forKey: .ingredient20)
        
        
        
        try? container.encode(strMeasure1, forKey: .strMeasure1)
        try? container.encode(strMeasure2, forKey: .strMeasure2)
        try? container.encode(strMeasure3, forKey: .strMeasure3)
        try? container.encode(strMeasure4, forKey: .strMeasure4)
        try? container.encode(strMeasure5, forKey: .strMeasure5)
        try? container.encode(strMeasure6, forKey: .strMeasure6)
        try? container.encode(strMeasure7, forKey: .strMeasure7)
        try? container.encode(strMeasure8, forKey: .strMeasure8)
        try? container.encode(strMeasure9, forKey: .strMeasure9)
        try? container.encode(strMeasure10, forKey: .strMeasure10)
        try? container.encode(strMeasure11, forKey: .strMeasure11)
        try? container.encode(strMeasure12, forKey: .strMeasure12)
        try? container.encode(strMeasure13, forKey: .strMeasure13)
        try? container.encode(strMeasure14, forKey: .strMeasure14)
        try? container.encode(strMeasure15, forKey: .strMeasure15)
        try? container.encode(strMeasure16, forKey: .strMeasure16)
        try? container.encode(strMeasure17, forKey: .strMeasure17)
        try? container.encode(strMeasure18, forKey: .strMeasure18)
        try? container.encode(strMeasure19, forKey: .strMeasure19)
        try? container.encode(strMeasure20, forKey: .strMeasure20)
        try? container.encode(strYoutube, forKey: .strYoutube)
    }
}






