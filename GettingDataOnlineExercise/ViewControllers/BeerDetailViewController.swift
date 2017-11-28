//
//  BeerDetailViewController.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    var beer: Beer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var foodPairingTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData() {
        nameLabel.text = beer.name
        abvLabel.text = "\(beer.abv)%"
        taglineLabel.text = beer.tagline
        foodPairingTextView.text = "\(beer.food_pairing)"
        descriptionLabel.text = beer.description
        if let pictureURL = URL(string: beer.image_url) {
            DispatchQueue.global().sync {
                if let data = try? Data.init(contentsOf: pictureURL) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
