//
//  ImagePicker.swift
//  MemeMe
//
//  Created by David Chea on 29/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    @Binding var isImageAdded: Bool
    
    @Binding var selectedImage: UIImage
    
    @Binding var isShowingImagePicker: Bool
    
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
        
        let parent: ImagePicker
        
        // MARK: - Initializer
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        // MARK: - Protocol method
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            
            parent.isImageAdded = true
            parent.selectedImage = selectedImage
            parent.isShowingImagePicker = false
        }
    }
}
