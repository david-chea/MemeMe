//
//  ViewController.swift
//  MemeMe
//
//  Created by David Chea on 10/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var topTextFieldView: UITextField!
    @IBOutlet weak var bottomTextFieldView: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    // Identify the button that was tapped
    enum ButtonType: Int {
        case camera = 0, album
    }
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: 5
        ]
        
        topTextFieldView.defaultTextAttributes = memeTextAttributes
        topTextFieldView.text = "TOP"
        topTextFieldView.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)
        topTextFieldView.textColor = UIColor.white
        topTextFieldView.textAlignment = .center
        
        bottomTextFieldView.defaultTextAttributes = memeTextAttributes
        bottomTextFieldView.text = "BOTTOM"
        bottomTextFieldView.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)
        bottomTextFieldView.textColor = UIColor.white
        bottomTextFieldView.textAlignment = .center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Disable the camera button if the device doesn't have a camera
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    // Trigger when the user tapped for picking an image
    @IBAction func pickAnImage(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        // Set the delegate to this controller
        imagePicker.delegate = self
        
        // Set the image's source type
        switch (ButtonType(rawValue: sender.tag)!) {
        case .camera:
            imagePicker.sourceType = .camera
        case .album:
            imagePicker.sourceType = .photoLibrary
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Retrieve and set the image to the view
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        
        // Dismiss the image picker's view
        dismiss(animated: true, completion: nil)
    }
}
