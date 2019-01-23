//
//  Cocktail.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import Foundation

class CocktailResponse: Codable {
    let cocktails: [Cocktail]?
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
    
}
class Cocktail: Codable {
    
    let idDrink: String?
    let strDrink: String?
    let strDrinkThumb: String?
}

extension Cocktail {
    enum CodingKeys: String, CodingKey {
        case idDrink = "idDrink"
        case strDrink = "strDrink"
        case strDrinkThumb = "strDrinkThumb"
        //        case ingredientsDrink
    }
}


