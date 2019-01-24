//
//  ResultatTableViewCell.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit
import Kingfisher


class ResultatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCocktail: UIImageView!
    @IBOutlet weak var nomCocktail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func remplirCellule(avecCocktail cocktail:Cocktail) {
        nomCocktail.text = cocktail.strDrink
        let url = URL(string: cocktail.strDrinkThumb ?? "")
        imageCocktail.kf.setImage(with: url)
    }
    
}

