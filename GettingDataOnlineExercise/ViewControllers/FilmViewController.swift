//
//  ViewController.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    var films = [Film]() {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    func loadData() {
        let urlStr = "https://ghibliapi.herokuapp.com/films"
        let completion: ([Film]) -> Void = {(onlineFilm: [Film]) in
            self.films = onlineFilm
        }
        FilmAPIClient.manager.getFilms(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FilmDetailViewController {
            destination.film = films[self.tableView.indexPathForSelectedRow!.row]
        }
    }
}
extension FilmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = films[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Films Cell", for: indexPath)
        cell.textLabel?.text = film.title
        cell.detailTextLabel?.text = film.director
        return cell
    }
}

