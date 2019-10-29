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
    
    @State private var selectedImage = UIImage()
    @State private var topText = "TOP"
    @State private var bottomText = "BOTTOM"
    
    @State private var isShowingImagePicker = false
    
    private var isImageAdded = false
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ZStack {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                    
                    VStack {
                        Spacer()
                        
                        TextField("", text: $topText)
                        
                        Spacer()
                        
                        TextField("", text: $bottomText)
                        
                        Spacer()
                    }
                    .foregroundColor(Color.red)
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
                    
                    Button(action: { self.isShowingImagePicker.toggle() }) {
                        Image(systemName: "photo")
                            .imageScale(.large)
                    }
                    .sheet(isPresented: $isShowingImagePicker) {
                        ImagePicker(selectedImage: self.$selectedImage, isShowingImagePicker: self.$isShowingImagePicker)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .navigationBarTitle("Create your meme")
            .navigationBarItems(trailing: shareButton)
        }
    }
    
    var shareButton: some View {
        Button(action: {}) {
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
        }
        .disabled(!isImageAdded)
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
