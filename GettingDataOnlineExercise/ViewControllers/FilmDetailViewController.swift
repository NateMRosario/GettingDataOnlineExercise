//
//  FilmDetailViewController.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

    var film: Film!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        titleLabel.text = film.title
        directorLabel.text = film.director
        producerLabel.text = film.producer
        dateLabel.text = film.release_date
        descriptionTextView.text = film.description
    }
    
}
