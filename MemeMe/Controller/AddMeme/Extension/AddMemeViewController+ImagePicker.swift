//
//  AddMemeViewController+ImagePicker.swift
//  MemeMe
//
//  Created by David Chea on 11/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

extension AddMemeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Delegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Retrieve and set the image to the view
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addImageView.image = image
            
            // An image has been chosen so enable the share button
            shareBarButtonItem.isEnabled = true
        }
        
        // Dismiss the album view
        dismiss(animated: true, completion: nil)
    }
}
