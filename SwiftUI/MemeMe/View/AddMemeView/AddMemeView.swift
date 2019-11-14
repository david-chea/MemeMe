//
//  AddMemeView.swift
//  MemeMe
//
//  Created by David Chea on 28/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct AddMemeView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var memeData: MemeData
    
    @State private var originalImage = UIImage(named: "image-black")!
    @State private var topText = "TOP"
    @State private var bottomText = "BOTTOM"
    
    @State private var isImageAdded = false
    
    @State private var isShowingActivityViewController = false
    @State private var isShowingImagePickerController = false
    
    private var isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera)
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ZStack {
                    Image(uiImage: originalImage)
                        .resizable()
                        .frame(width: 500, height: 350)
                        
                    VStack(spacing: 50) {
                        Spacer()
                        
                        MemeTextField(text: $topText)
                        
                        Spacer()
                        
                        MemeTextField(text: $bottomText)
                        
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 50, design: .default))
                    .multilineTextAlignment(.center)
                }
                
                Spacer()
                    
                HStack {
                    Spacer()
                    
                    Button(action: { self.isShowingImagePickerController.toggle() }) {
                        Image(systemName: "camera")
                    }
                    .disabled(!isCameraAvailable)
                    .sheet(isPresented: $isShowingImagePickerController) {
                        ImagePickerController(
                            originalImage: self.$originalImage,
                            isImageAdded: self.$isImageAdded,
                            isShowingImagePickerController: self.$isShowingImagePickerController
                        )
                    }
                    
                    Spacer()
                    
                    Button(action: { self.isShowingImagePickerController.toggle() }) {
                        Image(systemName: "photo")
                    }
                    .sheet(isPresented: $isShowingImagePickerController) {
                        ImagePickerController(
                            originalImage: self.$originalImage,
                            isImageAdded: self.$isImageAdded,
                            isShowingImagePickerController: self.$isShowingImagePickerController
                        )
                    }
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Create your meme")
            .navigationBarItems(trailing: activityButton)
        }
    }
    
    var activityButton: some View {
        Button(action: { self.isShowingActivityViewController.toggle() }) {
            Image(systemName: "square.and.arrow.up")
        }
        .disabled(!isImageAdded)
        .sheet(isPresented: $isShowingActivityViewController) {
            ActivityViewController(
                originalImage: self.originalImage,
                topText: self.topText,
                bottomText: self.bottomText
            )
                .environmentObject(self.memeData)
        }
    }
}

struct AddMemeView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            AddMemeView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
