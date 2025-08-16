//
//  ViewController.swift
//  SPCountryPikcerViewExamples
//
//  Created by kosal pen on 9/15/19.
//  Copyright © 2019 kosal pen. All rights reserved.
//

import UIKit
import SPCountryPikcerView

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let country = SPCountryPikcerView(on: textfield) { (titles) in
            print(titles)
        }
        self.textfield.inputView = country
    }
}

