//
//  ImagePickerController.swift
//  MemeMe
//
//  Created by David Chea on 29/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct ImagePickerController: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    @Binding var originalImage: UIImage
    @Binding var isImageAdded: Bool
    
    @Binding var isShowingImagePickerController: Bool
    
    // MARK: - Protocol methods
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        // MARK: - Property
        
        let parent: ImagePickerController
        
        // MARK: - Initializer
        
        init(parent: ImagePickerController) {
            self.parent = parent
        }
        
        // MARK: - Protocol method
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let originalImage = info[.originalImage] as? UIImage else { return }
            
            parent.originalImage = originalImage
            parent.isImageAdded = true
            parent.isShowingImagePickerController = false
        }
    }
}
