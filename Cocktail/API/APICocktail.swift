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
    static func getResult(laRecherche: String, completion:@escaping (Result<Data>)->Void)
    {
        let parametre: Parameters = ["s":laRecherche]
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/search.php", parameters: parametre)
            .responseData{ (response: DataResponse<Data>) in completion(response.result)
        }
    }
}


