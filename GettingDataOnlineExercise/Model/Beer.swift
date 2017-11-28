//
//  Beer.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct Beer: Codable {
    let name: String
    let tagline: String
    let description: String
    let image_url: String
    let abv: Double
    let food_pairing: [String]
}

