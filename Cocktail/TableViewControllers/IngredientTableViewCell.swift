//
//  IngredientTableViewCell.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    // Ingredient et la quantité
    @IBOutlet weak var ingredientMesure: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func remplirCellule(avecIngredientMesure ingreMes : String) {
        ingredientMesure.text = ingreMes
 
    }
    /*
	"idDrink":"15997"
    "strDrink":"GG"
    "strCategory":"Ordinary Drink"
    "strIBA":null
    "strAlcoholic":"Optional alcohol",
    "strGlass":"Collins Glass",
    "strInstructions":"Pour the Galliano liqueur over ice. Fill the remainder of the glass with ginger ale and thats all there is to it. You now have a your very own GG.",
    "strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/vyxwut1468875960.jpg",
    "strIngredient1":"Galliano",
    "strIngredient2":"Ginger ale",
    "strIngredient3":"Ice",
    "strIngredient4":"",
    "strIngredient5":"",
    "strIngredient6":"",
    "strIngredient7":"",
    "strIngredient8":"",
    "strIngredient9":"",
    "strIngredient10":"",
    "strIngredient11":"",
    "strIngredient12":"",
    "strIngredient13":"",
    "strIngredient14":"",
    "strIngredient15":"",
    "strMeasure1":"2 1\/2 shots ",
    "strMeasure2":"\n",
    "strMeasure3":" ",
    "strMeasure4":" ",
    "strMeasure5":" ",
    "strMeasure6":" ",
    "strMeasure7":" ",
    "strMeasure8":"",
    "strMeasure9":"",
    "strMeasure10":"",
    "strMeasure11":"",
    "strMeasure12":"",
    "strMeasure13":"",
    "strMeasure14":"",
    "strMeasure15":"",
 */
}
