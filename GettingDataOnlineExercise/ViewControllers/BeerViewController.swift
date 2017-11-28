//
//  BeerViewController.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController, UISearchBarDelegate {

    var beers = [Beer]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        loadData()
    }
    func loadData() {
        let urlStr = "https://api.punkapi.com/v2/beers"
        let completion: ([Beer]) -> Void = {(onlineBeer: [Beer]) in
            self.beers = onlineBeer
        }
        BeerAPIClient.manager.getFilms(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BeerDetailViewController {
            destination.beer = beers[self.tableView.indexPathForSelectedRow!.row]
        }
    }

}
extension BeerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = beers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Beer Cell", for: indexPath)
        cell.textLabel?.text = beer.name
        cell.detailTextLabel?.text = "\(beer.abv)%"
        return cell
    }
}

