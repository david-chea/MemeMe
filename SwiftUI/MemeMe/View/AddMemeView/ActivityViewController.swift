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
        let meme = Meme(memeImage: originalImage, originalImage: originalImage, topText: topText, bottomText: bottomText)
        data.memes.append(meme)
        
        return UIActivityViewController(activityItems: [originalImage], applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
