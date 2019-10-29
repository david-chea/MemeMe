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
    
    @State private var imageIsAdded = false
    @State private var topText = "TOP"
    @State private var bottomText = "BOTTOM"
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Spacer()
                    
                    TextField("", text: $topText)
                    
                    Spacer()
                    
                    TextField("", text: $bottomText)
                    
                    Spacer()
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .font(Font.system(size: 50, design: .default))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "camera")
                            .imageScale(.large)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "photo")
                            .imageScale(.large)
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
        .disabled(!imageIsAdded)
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
