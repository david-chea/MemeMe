//
//  MemeRow.swift
//  MemeMe
//
//  Created by David Chea on 30/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct MemeRow: View {
    
    // MARK: - Property
    
    let meme: Meme
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Image(uiImage: meme.originalImage)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing)
            Text("\(meme.topText) ... \(meme.bottomText)")
        }
    }
}
