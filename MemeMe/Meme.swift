//
//  Meme.swift
//  MemeMe
//
//  Created by David Chea on 11/08/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import UIKit

// MARK: - Object Meme

struct Meme {
    var topText: String
    var bottomText: String
    var originalImage: UIImage
    var memedImage: UIImage
}

// MARK: Meme methods

func save(topTextField: UITextField, bottomTextField: UITextField, imageView: UIImageView, memedImage: UIImage) {
    let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: memedImage)
}

func generateMemedImage(viewController: UIViewController) -> UIImage {
    UIGraphicsBeginImageContext(viewController.view.frame.size)
    viewController.view.drawHierarchy(in: viewController.view.frame, afterScreenUpdates: true)
    
    let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return memedImage
}
