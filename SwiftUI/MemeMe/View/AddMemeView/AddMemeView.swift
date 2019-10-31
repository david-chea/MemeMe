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
    
    @EnvironmentObject private var data: Data
    
    @State private var memeImage = UIImage()
    @State private var originalImage = UIImage(named: "image-black")!
    @State private var topText = "TOP"
    @State private var bottomText = "BOTTOM"
    
    @State private var isImageAdded = false
    
    @State private var isShowingActivityViewController = false
    @State private var isShowingImagePickerController = false
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ZStack {
                    Image(uiImage: originalImage)
                        .resizable()
                        .frame(width: 500, height: 400)
                        
                    VStack(spacing: 50) {
                        Spacer()
                        
                        TextField("", text: $topText)
                        
                        Spacer()
                        
                        TextField("", text: $bottomText)
                        
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 50, design: .default))
                    .multilineTextAlignment(.center)
                }
                
                Spacer()
                    
                HStack {
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "camera")
                            .imageScale(.large)
                    }
                    
                    Spacer()
                    
                    Button(action: { self.isShowingImagePickerController.toggle() }) {
                        Image(systemName: "photo")
                            .imageScale(.large)
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
            .navigationBarItems(trailing: shareButton)
        }
    }
    
    var shareButton: some View {
        Button(action: { self.isShowingActivityViewController.toggle() }) {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
        }
        .disabled(!isImageAdded)
        .sheet(isPresented: $isShowingActivityViewController) {
            ActivityViewController(
                isShowingActivityViewController: self.$isShowingActivityViewController,
                memeImage: self.memeImage,
                originalImage: self.originalImage,
                topText: self.topText,
                bottomText: self.bottomText
            )
                .environmentObject(self.data)
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
