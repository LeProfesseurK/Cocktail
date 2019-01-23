//
//  ViewController.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var boutonFavoris: UIButton!
    @IBOutlet weak var rechercheTextField: UITextField!
    @IBOutlet weak var boutonRechercher: UIButton!
    
    
    @IBAction func onClickBoutonRecherche(_ sender: Any) {
       self.performSegue(withIdentifier: "goListDrink", sender: boutonRechercher)
    }
    @IBAction func onClickBoutonFavoris(_ sender: Any) {
        self.performSegue(withIdentifier: "goListDrink", sender: boutonFavoris)
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
                            destinationResultatRechercheVC.prefilledString = "Tu as chercher " + (rechercheTextField.text ?? "")

                        }else if ((sender as! UIButton) == boutonFavoris) {
                            destinationResultatRechercheVC.type = ResultatType.fromFavorites
                            destinationResultatRechercheVC.prefilledString = "Mes cocktails favoris !"
                        }
                    }
                break
            default:
                break
            }
        }
    }


}

