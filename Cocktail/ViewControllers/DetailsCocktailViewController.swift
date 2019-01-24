//
//  DetailsCocktailViewController.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

class DetailsCocktailViewController: UIViewController {

    @IBOutlet weak var boutonAjoutFavoris: UIButton!
    @IBOutlet weak var imageDuCocktails: UIImageView!
    @IBOutlet weak var tableIngredient: UITableView!
    @IBOutlet weak var instructionCocktail: UILabel!
    @IBOutlet weak var nomCocktail: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func ajouterAuxFavoris(_ sender: Any) {
    }
}
