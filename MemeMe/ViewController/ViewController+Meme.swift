//
//  ViewController+Meme.swift
//  MemeMe
//
//  Created by David Chea on 12/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

extension ViewController {

    // MARK: Object Meme

    struct Meme {
        var topText: String
        var bottomText: String
        var originalImage: UIImage
        var memedImage: UIImage
    }

    // MARK: Meme methods

    func save(topTextField: UITextField, bottomTextField: UITextField, imageView: UIImageView, memedImage: UIImage) {
        let _ = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: memedImage)
    }

    func generateMemedImage(viewController: UIViewController) -> UIImage {
        // Hide toolbars
        topToolbar.isHidden = true
        bottomToolbar.isHidden = true
        
        // Render view to an image
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
