//
//  SPCountryPikcerView.swift
//  RedTaxi
//
//  Created by kosal pen on 9/8/19.
//  Copyright © 2019 Komsann Ly. All rights reserved.
//

import UIKit

@objcMembers class SPCountryPikcerView: SPPickerView {
    
    let country = SPCountry.getAllCountries()
    
    override init(on target: UITextField,
                  titles: [String],
                  selectionHandler: ((_ title: String) -> Void)? = nil) {

        let countryList = SPCountry.getAllCountries().map { (country) -> String in
            return "(\(country.phoneCode)) \(country.name) "
        }
        
        super.init(on: target,
                   titles: countryList,
                   selectionHandler: selectionHandler)
        
        let countryCode =  country.map { (country) -> String in
            return "\(country.code)"
        }
        
        let phoneCode = country.map { (country) -> String in
            return "\(country.phoneCode)"
        }
        
        if let code = Locale.preferredLanguages.first {
            if let regionCode = Locale(identifier: code).regionCode {
                if let index = countryCode.firstIndex(of: regionCode) {
                    self.textField.text = phoneCode[index]
                }
            }  else {
                if let index = countryCode.firstIndex(of: "KH") {
                    self.textField.text = phoneCode[index]
                }
            }
        } else {
            
            if let index = countryCode.firstIndex(of: "KH") {
                self.textField.text = phoneCode[index]
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func doneBarButtonAction() {
        model.selectHandler?(country[model.index].phoneCode)
        textField.text = country[model.index].phoneCode
        textField.resignFirstResponder()
    }
    
}
