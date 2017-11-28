//
//  Currency.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct Currency: Codable {
    let base: String
    let date: String
    let rates: [String:Double]
}

