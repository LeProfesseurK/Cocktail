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
    static func getResult(completion:@escaping (Result<Data>)->Void)
    {
        Alamofire.request("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")
            .responseData{ (response: DataResponse<Data>) in completion(response.result)
        }
    }
}


