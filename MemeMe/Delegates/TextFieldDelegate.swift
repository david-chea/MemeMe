//
//  TextFieldDelegate.swift
//  MemeMe
//
//  Created by David Chea on 11/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

// MARK - TextFieldDelegate: NSObject, UITextFieldDelegate

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // MARK: Properties
    
    var isFirstTimeTop = true
    var isFirstTimeBottom = true
    
    // MARK: Delegate methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isFirstTimeTop && textField.accessibilityIdentifier == "topTextField" {
            textField.text = ""
            isFirstTimeTop = false
        } else if isFirstTimeBottom && textField.accessibilityIdentifier == "bottomTextField" {
            textField.text = ""
            isFirstTimeBottom = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        return true
    }
}
