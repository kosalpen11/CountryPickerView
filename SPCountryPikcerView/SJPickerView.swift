//
//  SJPickerView.swift
//  Somjot
//
//  Created by kosal pen on 3/13/19.
//  Copyright © 2019 Spark Digital. All rights reserved.
//

import UIKit

@objcMembers open class SPPickerView: UIPickerView {
    
    let model: SJPickerViewData
    
    var textField: UITextField!
    var oldValue: String!
    
    init(on target: UITextField, titles: [String], selectionHandler: ((_ title: String) -> Void)? = nil) {
        
        self.model = SJPickerViewData(titles, selectionHandler: selectionHandler)
        super.init(frame: CGRect.zero)
        self.delegate = model
        self.dataSource = model
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let cancelBarButton = UIBarButtonItem(title: "Cancel",
                                              style: .plain,
                                              target: self,
                                              action: #selector(cancelBarButtonAction))
        cancelBarButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let doneBarButton = UIBarButtonItem(title: "Done",
                                            style: .plain,
                                            target: self,
                                            action: #selector(doneBarButtonAction))
        
        doneBarButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        
        toolbar.setItems([cancelBarButton,
                          space,
                          doneBarButton],
                         animated: false)
        
        toolbar.isUserInteractionEnabled = true
        target.inputAccessoryView = toolbar
        
        textField = target
        oldValue = textField.text!
    }
    
    @objc func cancelBarButtonAction() {
        model.selectHandler?(oldValue)
        //textField.text = oldValue
        textField.resignFirstResponder()
    }
    
    @objc func doneBarButtonAction() {
        
        model.selectHandler?(model.result)
        textField.text = model.result
        textField.resignFirstResponder()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.model = SJPickerViewData([], selectionHandler: nil)
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    class SJPickerViewData: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        
        var items = [String]()
        var result: String!
        var selectHandler: ((_ title: String) -> Void)?
        var index = 0
        
        override init() {
            super.init()
        }
        
        convenience init(_ titles: [String],
                         selectionHandler: ((_ title: String) -> Void)?) {
            self.init()
            self.items = titles
            self.result = titles[0]
            self.selectHandler = selectionHandler
            self.index = 0
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return items.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return items[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            result = items[row]
            index = row
        }
        
    }
}
