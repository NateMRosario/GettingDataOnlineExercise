//
//  CurrencyViewController.swift
//  GettingDataOnlineExercise
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    var allCurrencies = [String]()

    var baseCurrency: Currency? {
        didSet {
            allCurrencies = baseCurrency!.rates.keys.sorted()
            basePicker.reloadAllComponents()
            convertPicker.reloadAllComponents()
        }
    }
    
    @IBOutlet weak var basePicker: UIPickerView!
    @IBOutlet weak var convertPicker: UIPickerView!
    @IBOutlet weak var ratesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basePicker.delegate = self
        convertPicker.delegate = self
        basePicker.dataSource = self
        convertPicker.dataSource = self
        loadData()
    }

    func loadData() {
        let urlStr = "https://api.fixer.io/latest?base=USD"
        let completion: (Currency) -> Void = {(onlineCurrency: Currency) in
            self.baseCurrency = onlineCurrency
        }
        CurrencyAPIClient.manager.getCurrency(from: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }
}
extension CurrencyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.allCurrencies.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allCurrencies[row]
    }
    

}
