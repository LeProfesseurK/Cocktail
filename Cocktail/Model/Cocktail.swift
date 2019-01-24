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
    let strCategory: String?
    let strIBA: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strDrinkThumb: String?
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    
    func  tableauIngredient() -> [String]{
        var tabIngredient:[String]=[]
        var ingMes : String = ""
        if let ingredient1 = strIngredient1, !ingredient1.isEmpty{
            ingMes = ingredient1
            if let mesure1 = strMeasure1, !mesure1.isEmpty{
                ingMes += " : " + mesure1
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient2 = strIngredient2, !ingredient2.isEmpty{
            ingMes = ingredient2
            if let mesure2 = strMeasure2, !mesure2.isEmpty{
                ingMes += " : " + mesure2
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient3 = strIngredient3, !ingredient3.isEmpty{
            ingMes = ingredient3
            if let mesure3 = strMeasure3, !mesure3.isEmpty{
                ingMes += " : " + mesure3
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient4 = strIngredient4, !ingredient4.isEmpty{
            ingMes = ingredient4
            if let mesure4 = strMeasure4, !mesure4.isEmpty{
                ingMes += " : " + mesure4
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient5 = strIngredient5, !ingredient5.isEmpty{
            ingMes = ingredient5
            if let mesure5 = strMeasure5, !mesure5.isEmpty{
                ingMes += " : " + mesure5
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient6 = strIngredient6, !ingredient6.isEmpty{
            ingMes = ingredient6
            if let mesure6 = strMeasure6, !mesure6.isEmpty{
                ingMes += " : " + mesure6
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient7 = strIngredient7, !ingredient7.isEmpty{
            ingMes = ingredient7
            if let mesure7 = strMeasure7, !mesure7.isEmpty{
                ingMes += " : " + mesure7
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient8 = strIngredient8, !ingredient8.isEmpty{
            ingMes = ingredient8
            if let mesure8 = strMeasure8, !mesure8.isEmpty{
                ingMes += " : " + mesure8
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient9 = strIngredient9, !ingredient9.isEmpty{
            ingMes = ingredient9
            if let mesure9 = strMeasure9, !mesure9.isEmpty{
                ingMes += " : " + mesure9
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient10 = strIngredient10, !ingredient10.isEmpty{
            ingMes = ingredient10
            if let mesure10 = strMeasure10, !mesure10.isEmpty{
                ingMes += " : " + mesure10
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient11 = strIngredient11, !ingredient11.isEmpty{
            ingMes = ingredient11
            if let mesure11 = strMeasure11, !mesure11.isEmpty{
                ingMes += " : " + mesure11
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient12 = strIngredient12, !ingredient12.isEmpty{
            ingMes = ingredient12
            if let mesure12 = strMeasure12, !mesure12.isEmpty{
                ingMes += " : " + mesure12
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient13 = strIngredient13, !ingredient13.isEmpty{
            ingMes = ingredient13
            if let mesure13 = strMeasure13, !mesure13.isEmpty{
                ingMes += " : " + mesure13
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient14 = strIngredient14, !ingredient14.isEmpty{
            ingMes = ingredient14
            if let mesure14 = strMeasure14, !mesure14.isEmpty{
                ingMes += " : " + mesure14
            }
            tabIngredient.append(ingMes)
        }
        if let ingredient15 = strIngredient15, !ingredient15.isEmpty{
            ingMes = ingredient15
            if let mesure15 = strMeasure15, !mesure15.isEmpty{
                ingMes += " : " + mesure15
            }
            tabIngredient.append(ingMes)
        }
        
        return tabIngredient
    }
}

extension Cocktail {
    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        case strCategory
        case strIBA
        case strAlcoholic
        case strGlass
        case strDrinkThumb
        case strInstructions
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
    }
}
