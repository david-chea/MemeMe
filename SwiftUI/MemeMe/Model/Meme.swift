//
//  Meme.swift
//  MemeMe
//
//  Created by David Chea on 30/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

class Meme: Identifiable {
    
    // MARK: - Properties
    
    let memedImage: UIImage
    let originalImage: UIImage
    let topText: String
    let bottomText: String
    
    // MARK: - Initializer
    
    init(memedImage: UIImage, originalImage: UIImage, topText: String, bottomText: String) {
        self.memedImage = memedImage
        self.originalImage = originalImage
        self.topText = topText
        self.bottomText = bottomText
    }
}
