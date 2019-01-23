//
//  Cocktail.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import Foundation

class Cocktail: Codable {
    
    let idDrink: String?
    let strDrink: String?
    
    //    let ingredientsDrink: [String]?
    
        //required init
       /* required init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            idDrink = try values.decode(String.self, forKey: .idDrink)
            // Les autres default
    
            let ingredient1 = try values.decode(String.self, forKey: .strIngredient1)
    
            ingredientsDrink?.append(ingredient1)
        }*/
}

extension Cocktail {
    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        //        case ingredientsDrink
    }
}


