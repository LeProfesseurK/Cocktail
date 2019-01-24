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
        tableIngredient.delegate = self 
        tableIngredient.dataSource = self

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
        var tabCocktailsFavorie : [Cocktail] = []
        print("ok1")
        let decoder = JSONDecoder()
        if let unCocktail = UserDefaults.standard.data(forKey: "Cocktails_Favoris"),
            let cocktails = try? decoder.decode([Cocktail].self, from: unCocktail) {
            
            tabCocktailsFavorie = cocktails ?? []
            print(tabCocktailsFavorie.count)
        }
        print("ok2")
        if let nouveauCocktail = detailsCocktail{
            print(nouveauCocktail.strDrink)
            if !tabCocktailsFavorie.contains(where: {$0.idDrink == nouveauCocktail.idDrink}){
                tabCocktailsFavorie.append(nouveauCocktail)
            }
            print(tabCocktailsFavorie.count)
        }
        print("ok3")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tabCocktailsFavorie) {
            UserDefaults.standard.set(encoded, forKey: "Cocktails_Favoris")
        }
        print("ok4")
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

extension DetailsCocktailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension DetailsCocktailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("avant if")
        if let monCocktail = detailsCocktail{
            print (monCocktail.tableauIngredient().count)
            return monCocktail.tableauIngredient().count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableauIngredientMesure : [String] = []
        if let monCocktail = detailsCocktail{
            tableauIngredientMesure = monCocktail.tableauIngredient()
        }
        let cell: IngredientTableViewCell = tableIngredient.dequeueReusableCell(withIdentifier: "mesureIngredient", for: indexPath)  as! IngredientTableViewCell
            cell.remplirCellule(avecIngredientMesure : tableauIngredientMesure[indexPath.row])
            //cell.remplirCellule(withString: listOfCocktails[indexPath.row]., withString: listOfCocktails[indexPath.row]))
        print ("-----"+tableauIngredientMesure[indexPath.row])
            return cell
    }
}

