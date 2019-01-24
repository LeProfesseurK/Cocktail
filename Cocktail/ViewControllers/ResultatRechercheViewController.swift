//
//  ResultatRechercheViewController.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

enum ResultatType {
    case fromSearch
    case fromFavorites
    case fromSearchIngredient
}

class ResultatRechercheViewController: UIViewController {
    
    @IBOutlet weak var titrePage: UILabel!
    @IBOutlet weak var tableResultatRecherche: UITableView!
    var listOfCocktails: [Cocktail] = []
    var recherche: String = ""
    var prefilledString: String?
    var type: ResultatType = ResultatType.fromSearch
    var position: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableResultatRecherche.delegate = self
        tableResultatRecherche.dataSource = self
        
        if let prefilledStringLet = prefilledString{prefilledStringLet
            switch type{
                case ResultatType.fromSearch :
                    getCocktails(prefilledString: prefilledString ?? "")
                    //print (prefilledString)
                    break
                case ResultatType.fromSearchIngredient :
                    getCocktailsIngredient(prefilledString: prefilledString ?? "")
                    //print (prefilledString)
                    break
                case ResultatType.fromFavorites :
                    print("voir favorie 1")
//                    var tabCocktail: [Cocktail] = []
                    let decoder = JSONDecoder()
                    if let unCocktail1 = UserDefaults.standard.data(forKey: "Cocktails_Favoris"){
                    print(unCocktail1)
            }
                    if let unCocktail = UserDefaults.standard.data(forKey: "Cocktails_Favoris"),
                    let cocktails = try? decoder.decode([Cocktail].self, from: unCocktail){
                        print("Voir mes favorie")
//                        print(cocktail.strDrink)
//                        print(cocktail.idDrink)
//                        tabCocktail.append(cocktail)
                        self.listOfCocktails = cocktails ?? []
                        self.tableResultatRecherche.reloadData()
                    break
                    }
                    
                    
                    break
            }
            
            
        }
        
        
        
        
        
        
    }
    
    private func getCocktailsIngredient(prefilledString:String) {
        APICocktail.getCocktailByIngredient(laRecherche: prefilledString) {[weak self] (result) in
            switch result {
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let response: CocktailResponse = try decoder.decode(CocktailResponse.self, from: value)
                    if let cocktails = response.cocktails {
                        self?.listOfCocktails = cocktails
                        self?.tableResultatRecherche.reloadData()
                    }
                    
                    print (response.cocktails?.first?.strDrink ?? "")
                }
                catch (let error){
                    print (error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getCocktails(prefilledString:String) {
        APICocktail.getCocktailByName(laRecherche: prefilledString) {[weak self] (result) in
            switch result {
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let response: CocktailResponse = try decoder.decode(CocktailResponse.self, from: value)
                    if let cocktails = response.cocktails {
                        self?.listOfCocktails = cocktails
                        self?.tableResultatRecherche.reloadData()
                    }
                    
                    print (response.cocktails?.first?.strDrink ?? "")
                }
                catch (let error){
                    print (error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let prefilledStringLet = prefilledString {
            switch type{
                case ResultatType.fromFavorites:
                    titrePage.text = prefilledStringLet
                case ResultatType.fromSearch:
                    titrePage.text = "Tu as cherché "+prefilledStringLet
                case ResultatType.fromSearchIngredient:
                    titrePage.text = "Recherche par ingrdient : "+prefilledStringLet
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ResultatRechercheViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }

}

extension ResultatRechercheViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCocktails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultatTableViewCell = tableResultatRecherche.dequeueReusableCell(withIdentifier: "cocktailResultID", for: indexPath)  as! ResultatTableViewCell
        cell.remplirCellule(avecCocktail: listOfCocktails[indexPath.row])
        //cell.remplirCellule(withString: listOfCocktails[indexPath.row]., withString: listOfCocktails[indexPath.row]))
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if type == ResultatType.fromSearch{
            position = indexPath.row
            
            self.performSegue(withIdentifier: "goDetails", sender: nil)
            
            print ( listOfCocktails[indexPath.row].idDrink ?? "")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier{
            case "goDetails":
                if let destinationResultatRechercheVC = segue.destination as?
                    DetailsCocktailViewController{
                    destinationResultatRechercheVC.detailsCocktail = listOfCocktails[position]
                    }
                break
            default:
                break
            }
        }
    }
}
