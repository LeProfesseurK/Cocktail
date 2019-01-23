//
//  ResultatRechercheViewController.swift
//  Cocktail
//
//  Created by etudiant on 22/01/2019.
//  Copyright © 2019 ViNiKi. All rights reserved.
//

import UIKit

class ResultatRechercheViewController: UIViewController {
    
    @IBOutlet weak var titrePage: UILabel!
    @IBOutlet weak var tableResultatRecherche: UITableView!
    var listOfCocktails: [Cocktail] = []
    var recherche: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableResultatRecherche.delegate = self
        tableResultatRecherche.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

extension ResultatRechercheViewController : UITableViewDelegate {
    
}

extension ResultatRechercheViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCocktails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultatTableViewCell = tableResultatRecherche.dequeueReusableCell(withIdentifier: "cocktailResultID", for: indexPath)  as! ResultatTableViewCell
        //cell.remplirCellule(withString: listOfCocktails[indexPath.row]., withString: listOfCocktails[indexPath.row]))
        return cell
    }
    
    
}





