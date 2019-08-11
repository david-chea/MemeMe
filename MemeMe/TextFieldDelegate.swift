//
//  TextFieldDelegate.swift
//  MemeMe
//
//  Created by David Chea on 11/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var isFirstTimeTop: Bool
    var isFirstTimeBottom: Bool
    
    override init() {
        isFirstTimeTop = true
        isFirstTimeBottom = true
        
        super.init()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isFirstTimeTop && textField.accessibilityIdentifier == "topTextField" {
            textField.text = ""
            isFirstTimeTop = false
        } else if isFirstTimeBottom && textField.accessibilityIdentifier == "bottomTextField" {
            textField.text = ""
            isFirstTimeBottom = false
        }
    }
}
