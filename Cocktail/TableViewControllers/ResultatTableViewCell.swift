//
//  ResultatTableViewCell.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

class ResultatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCocktail: UIView!
    @IBOutlet weak var nomCocktail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func remplirCellule(withString nom:String, withString image:String){
        nomCocktail.text = nom
        // imageCocktail
    }
    
}

