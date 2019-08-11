//
//  ViewController+ImagePicker.swift
//  MemeMe
//
//  Created by David Chea on 11/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Retrieve and set the image to the view
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        
        // Dismiss the image picker's view
        dismiss(animated: true, completion: nil)
    }
}
