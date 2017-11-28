//
//  BeerAPIClient.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

class BeerAPIClient {
    private init() {}
    static let manager = BeerAPIClient()
    func getFilms(from urlStr: String,
                  completionHandler: @escaping ([Beer]) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let film = try JSONDecoder().decode([Beer].self, from: data)
                completionHandler(film)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
