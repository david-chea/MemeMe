//
//  AddMemeViewController+Meme.swift
//  MemeMe
//
//  Created by David Chea on 12/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

extension AddMemeViewController {

    // MARK: Meme methods

    // Create a Meme and add it to "memes" array
    func save(topTextField: UITextField, bottomTextField: UITextField, imageView: UIImageView, memedImage: UIImage) {
        // Create a Meme
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: memedImage)
        
        // Add it to "memes" array
        (UIApplication.shared.delegate as! AppDelegate).memes.append(meme)
    }

    // Generate a memed image
    func generateMemedImage(viewController: UIViewController) -> UIImage {
        // Hide toolbars
        topToolbar.isHidden = true
        bottomToolbar.isHidden = true
        
        // Create an UIImage that combines ImageView and TextFields
        UIGraphicsBeginImageContext(viewController.view.frame.size)
        viewController.view.drawHierarchy(in: viewController.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Show toolbars
        topToolbar.isHidden = false
        bottomToolbar.isHidden = false
        
        return memedImage
    }
}
