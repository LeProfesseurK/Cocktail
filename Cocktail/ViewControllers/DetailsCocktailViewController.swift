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
    @IBOutlet weak var alchool: UILabel!
    @IBOutlet weak var typeVerre: UILabel!
    @IBOutlet weak var category: UILabel!
    
    var detailsCocktail:Cocktail?
    
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
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(detailsCocktail) {
            UserDefaults.standard.set(encoded, forKey: "Cocktails_Favoris")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(detailsCocktail?.strDrink)

        nomCocktail.text = "Nom du cocktail : "+(detailsCocktail?.strDrink ?? "")
        let url = URL(string: detailsCocktail?.strDrinkThumb ?? "")
        //        imageCocktail.kf.setImage(with: url)
        imageDuCocktails.sd_setImage(with: url)
        typeVerre.text = "Type de verre : "+(detailsCocktail?.strGlass ?? "")
        alchool.text = " Alchool : "+(detailsCocktail?.strAlcoholic ?? "")
        category.text = " Catégorie : "+(detailsCocktail?.strCategory ?? "")
        instructionCocktail.text = detailsCocktail?.strInstructions
        
    }
}

//extension DetailsCocktailViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 
//    }
//    
//    // Tableau ingredient
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}

extension DetailsCocktailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
