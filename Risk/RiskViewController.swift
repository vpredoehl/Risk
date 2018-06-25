//
//  RiskViewController.swift
//
//
//  Created by Vincent Predoehl on 6/21/18.
//  Copyright © 2018 Vincent Predoehl. All rights reserved.
//

import UIKit

let cost = [ "AUD/CAD": 8.06, "AUD/CHF": 10.23,
              "AUD/JPY" : 8.83, "AUD/NZD" : 7.16, "AUD/USD" : 10,
              "CAD/CHF" : 10.23, "CAD/JPY" : 8.83, "CHF/JPY" : 8.83,
              "EUR/AUD": 7.83, "EUR/CAD" : 8.06, "EUR/CHF": 10.23,
              "EUR/GBP" : 13.54, "EUR/JPY": 8.83, "EUR/USD": 10,
              "EUR/NZD": 7.16,"EUR/TRY": 4.36, "GBP/AUD": 7.83,
              "GBP/CAD":8.06, "GBP/CHF": 10.23, "GBP/JPY": 8.83,
              "GBP/NZD": 7.16,"GBP/USD": 10, "NZD/CAD": 8.06,
              "NZD/CHF": 10.23, "NZD/JPY": 8.83, "NZD/USD": 10,
              "USD/CAD": 8.06, "USD/CHF":10.23, "USD/CNY": 1.63,
              "USD/INR": 16.07, "USD/JPY": 8.83, "USD/NOK":1.29,
              "USD/TRY": 4.36, "XAG/USD": 10, "XAU/USD":10, "XTI/USD": 10, "XBR/USD": 10 ]

let pair = Array(cost.keys).sorted()

class RiskViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,
UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cost.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        guard view == nil else {
            return view!
        }
        let lab = UILabel()
        lab.text = pair[row]
        lab.backgroundColor = .clear
        lab.sizeToFit()
        return lab
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.inputAccessoryView = accV
    }
    
    @IBOutlet weak var accountValue: UITextField!
    @IBOutlet weak var pipRisk: UITextField!
    @IBOutlet weak var USDRisk: UILabel!
    @IBOutlet weak var currencyPairPicker: UIPickerView!
    
    let accV: UIView! = UINib(nibName: "AccessoryView", bundle: nil).instantiate(withOwner: nil)[0] as! UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for v in accV.subviews {
            let btn = v as! UIButton
            
            btn.addTarget(self, action: #selector(btnPress(sender:)), for: .touchUpInside)
        }
    }
    
    @objc func btnPress(sender: UIButton) {
        print(sender.currentTitle)
    }
    
}

