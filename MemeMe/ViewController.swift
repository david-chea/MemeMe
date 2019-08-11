//
//  ViewController.swift
//  MemeMe
//
//  Created by David Chea on 10/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
 
    // MARK: Outlets
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraBarButtonItem: UIBarButtonItem!
    
    // MARK: Controllers
    
    let imagePickerController = UIImagePickerController()
    
    // MARK: Delegate objects
    
    let textFieldDelegate = TextFieldDelegate()
    
    // MARK: Properties
    
    var isBottomTextFieldTouched = false
    
    // MARK: ???
    
    // Identify the button that was tapped
    enum ButtonType: Int {
        case camera = 0, album
    }
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set text attributes
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.black,
            .strokeWidth: -5
        ]
        
        topTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = .center
        
        bottomTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.textAlignment = .center
        
        // Set the delegates
        topTextField.delegate = textFieldDelegate
        bottomTextField.delegate = textFieldDelegate
        imagePickerController.delegate = self
        
        bottomTextField.addTarget(self, action: #selector(bottomTextFieldTouched), for: .touchDown)
    }
    
    @objc func bottomTextFieldTouched() {
        isBottomTextFieldTouched = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Disable the camera button if the device doesn't have a camera
        cameraBarButtonItem.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: Subscribe/unsubscribe to keyboard notifications
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Only move the view if it's the bottom text field that was touched
    @objc func keyboardWillShow(_ notification: Notification) {
        if isBottomTextFieldTouched {
            view.frame.origin.y -= getKeyboardHeight(notification)
            isBottomTextFieldTouched = false
        }
    }
    
    // Set the view to it's original position
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        
        return keyboardSize.cgRectValue.height
    }
    
    // MARK: Actions
    
    // Trigger when the user tapped for picking an image
    @IBAction func pickAnImage(_ sender: UIBarButtonItem) {
        // Set the image's source type
        switch (ButtonType(rawValue: sender.tag)!) {
        case .camera:
            imagePickerController.sourceType = .camera
        case .album:
            imagePickerController.sourceType = .photoLibrary
        }
        
        present(imagePickerController, animated: true, completion: nil)
    }
}
