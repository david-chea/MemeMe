//
//  MemeDetailView.swift
//  MemeMe
//
//  Created by David Chea on 02/11/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct MemeDetailView: View {
    
    // MARK: - Property
    
    var memeImage = UIImage(named: "image-black")!
    
    // MARK: - View
    
    var body: some View {
        Image(uiImage: memeImage)
            .resizable()
            .frame(width: 500, height: 400)
    }
}

struct MemeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            MemeDetailView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
