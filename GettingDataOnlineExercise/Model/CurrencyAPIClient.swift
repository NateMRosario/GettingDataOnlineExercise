//
//  CurrencyAPIClient.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

class CurrencyAPIClient {
    private init() {}
    static let manager = CurrencyAPIClient()
    func getCurrency(from urlStr: String,
                  completionHandler: @escaping (Currency) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let currency = try JSONDecoder().decode(Currency.self, from: data)
                completionHandler(currency)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
