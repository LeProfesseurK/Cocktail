//
//  Cocktail.swift
//  Cocktail
//
//  Created by etudiant on 23/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import Foundation
import Alamofire

class  APICocktail {
    
    /// getCocktailByName
    ///
    /// - Parameters:
    ///   - laRecherche: laRecherche parametre pour le get de l api
    ///   - completion: completion Renvoie un JSON
    static func getCocktailByName(laRecherche: String, completion:@escaping (Result<Data>)->Void)
    {
        let parametre: Parameters = ["s":laRecherche]
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/search.php", parameters: parametre)
            .responseData{ (response: DataResponse<Data>) in completion(response.result)
        }
    }
    
    
    /// getCocktailByIngredient
    ///
    /// - Parameters:
    ///   - laRecherche: laRecherche parametre pour le get de l api
    ///   - completion: completion Renvoie un JSON
    static func getCocktailByIngredient(laRecherche: String, completion:@escaping (Result<Data>)->Void)
    {
        let parametre: Parameters = ["i":laRecherche]
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/filter.php", parameters: parametre)
            .responseData{ (response: DataResponse<Data>) in completion(response.result)
        }
    }
    
    
    /// getCocktailRandom
    ///
    /// - Parameter completion: completion completion Renvoie un JSON
    static func getCocktailRandom(completion:@escaping (Result<Data>)->Void)
    {
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/random.php")
            .responseData{ (response: DataResponse<Data>) in completion(response.result)
        }
    }
}
