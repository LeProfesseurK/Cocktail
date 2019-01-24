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
}

class ResultatRechercheViewController: UIViewController {
    
    @IBOutlet weak var titrePage: UILabel!
    @IBOutlet weak var tableResultatRecherche: UITableView!
    var listOfCocktails: [Cocktail] = []
    var recherche: String = ""
    var prefilledString: String?
    var type: ResultatType = ResultatType.fromSearch
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableResultatRecherche.delegate = self
        tableResultatRecherche.dataSource = self
        
        getMovies(prefilledString: prefilledString ?? "")
        //print (prefilledString)
    }
    
    private func getMovies(prefilledString:String) {
        APICocktail.getResult(laRecherche: prefilledString) {[weak self] (result) in
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
            titrePage.text = "Tu as cherché "+prefilledStringLet
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
        self.performSegue(withIdentifier: "goDetails", sender: nil)

        print ( listOfCocktails[indexPath.row].idDrink ?? "")
    }
}
