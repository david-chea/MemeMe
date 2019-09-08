//
//  AddMemeViewController.swift
//  MemeMe
//
//  Created by David Chea on 10/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class AddMemeViewController: UIViewController {
 
    // MARK: Outlets
    
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var cameraBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var addImageView: UIImageView!
    
    // MARK: Properties
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Identify the button that was tapped
    enum ButtonType: Int {
        case camera = 0, album
    }
    
    var isBottomTextFieldTapped = false
    
    // MARK: Controllers
    
    let imagePickerController = UIImagePickerController()
    
    // MARK: Delegate objects
    
    let textFieldDelegate = TextFieldDelegate()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set image view delegate
        imagePickerController.delegate = self
        
        // Set text fields attributes and delegate
        configureTextField(topTextField)
        configureTextField(bottomTextField)
        
        // The controller will know as soon as the user tapped the bottom text field
        bottomTextField.addTarget(self, action: #selector(bottomTextFieldTapped), for: .touchDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationTabBar(true)
        
        // Disable the camera button if the device doesn't have a camera
        cameraBarButtonItem.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        hideNavigationTabBar(false)
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: Actions
    
    // Trigger when the user tapped for sharing a meme
    @IBAction func shareAction(_ sender: Any) {
        // Generate a memed image
        let memedImage = generateMemedImage(viewController: self)
        
        // Define an instance of UIActivityViewController and pass the memed image as an activity item
        let activityViewController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
        // UIActivityViewController has finished and it's time to do some final operations
        activityViewController.completionWithItemsHandler = {
            (activityType, completed, returnedItems, activityError) in
            if (completed && activityError == nil) {
                // Save the memed image and back to the previous screen
                self.save(topTextField: self.topTextField, bottomTextField: self.bottomTextField, imageView: self.addImageView, memedImage: memedImage)
                self.backPreviousScreen()
            }
        }
        
        // Present the sharing view
        present(activityViewController, animated: true, completion: nil)
    }
    
    // Back to the previous screen
    @IBAction func cancelAction(_ sender: Any) {
        backPreviousScreen()
    }
    
    // Trigger when the user tapped for picking an image
    @IBAction func albumAction(_ sender: UIBarButtonItem) {
        // Set the image's source type
        switch (ButtonType(rawValue: sender.tag)!) {
        case .camera:
            imagePickerController.sourceType = .camera
        case .album:
            imagePickerController.sourceType = .photoLibrary
        }
        
        // Present the album view
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: Methods
    
    // Show/hide navigation and tab bar
    func hideNavigationTabBar(_ isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
        tabBarController?.tabBar.isHidden = isHidden
    }
    
    func configureTextField(_ textField: UITextField) {
        textField.defaultTextAttributes = [
            .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.black,
            .strokeWidth: -5
        ]
        textField.textAlignment = .center
        textField.delegate = textFieldDelegate
    }
    
    @objc func bottomTextFieldTapped() {
        isBottomTextFieldTapped = true
    }
    
    // Subscribe to keyboard notifications
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Unsubscribe to keyboard notifications
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Only move the view if it's the bottom text field that was touched
    @objc func keyboardWillShow(_ notification: Notification) {
        if isBottomTextFieldTapped {
            view.frame.origin.y -= getKeyboardHeight(notification)
            isBottomTextFieldTapped = false
        }
    }
    
    // Set the view to its original position
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        
        return keyboardSize.cgRectValue.height
    }
    
    // Back to the previous screen
    func backPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }
}
