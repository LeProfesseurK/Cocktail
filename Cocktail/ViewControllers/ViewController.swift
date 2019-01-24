//
//  ViewController.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boutonRechercheIngredient: UIButton!
    @IBOutlet weak var boutonRandom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var boutonFavoris: UIButton!
    @IBOutlet weak var rechercheTextField: UITextField!
    @IBOutlet weak var boutonRechercher: UIButton!
    var cocktailRand : Cocktail?
    @IBAction func onClickBoutonRecherche(_ sender: Any) {
       self.performSegue(withIdentifier: "goListDrink", sender: boutonRechercher)
    }
    @IBAction func onClickBoutonFavoris(_ sender: Any) {
        self.performSegue(withIdentifier: "goListDrink", sender: boutonFavoris)
    }
    
    @IBAction func onClickRechercheIngredient(_ sender: Any) {
        self.performSegue(withIdentifier: "goListDrink", sender: boutonRechercheIngredient)
    }
    
    @IBAction func onClickRandom(_ sender: Any) {
        APICocktail.getCocktailRandom() {[weak self] (result) in
            switch result {
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let response: CocktailResponse = try decoder.decode(CocktailResponse.self, from: value)
                    if let cocktails = response.cocktails {
                        print ( "- prepare in VC-")
                        print(cocktails.first?.strDrink)
                        print ("--")
                        self?.cocktailRand = cocktails.first
                        self?.performSegue(withIdentifier: "goRandom", sender: self?.boutonRandom)
                    }
                    
                }
                catch (let error){
                    print (error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier{
            case "goListDrink":
                    if let destinationResultatRechercheVC = segue.destination as?
                        ResultatRechercheViewController{
                        
                        if ((sender as! UIButton) == boutonRechercher) {
                            destinationResultatRechercheVC.type = ResultatType.fromSearch
                            //destinationResultatRechercheVC.prefilledString = "megumin recherche"
                            destinationResultatRechercheVC.prefilledString = (rechercheTextField.text ?? "")

                        }else if ((sender as! UIButton) == boutonFavoris) {
                            destinationResultatRechercheVC.type = ResultatType.fromFavorites
                            destinationResultatRechercheVC.prefilledString = "Mes cocktails favoris !"
                        }else if ((sender as! UIButton) == boutonRechercheIngredient) {
                            destinationResultatRechercheVC.type = ResultatType.fromSearchIngredient
                            //destinationResultatRechercheVC.prefilledString = "megumin recherche"
                            destinationResultatRechercheVC.prefilledString = (rechercheTextField.text ?? "")
                        }
                    }
                break
            case "goRandom":
                if let destinationResultatRandomVC = segue.destination as?
                    DetailsCocktailViewController{
                        destinationResultatRandomVC.detailsCocktail = cocktailRand
                }
                
                break
            default:
                break
            }
        }
    }

}

