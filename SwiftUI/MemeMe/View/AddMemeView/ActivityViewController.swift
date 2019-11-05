//
//  ActivityViewController.swift
//  MemeMe
//
//  Created by David Chea on 31/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    @EnvironmentObject private var data: Data
    
    let originalImage: UIImage
    let topText: String
    let bottomText: String
    
    // MARK: - Protocol methods
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: [originalImage], applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = { activityType, completed, returnedItems, activityError in
            if (completed && activityError == nil) {
                let meme = Meme(memeImage: self.originalImage, originalImage: self.originalImage, topText: self.topText, bottomText: self.bottomText)
                self.data.memes.append(meme)
            }
        }
        
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
