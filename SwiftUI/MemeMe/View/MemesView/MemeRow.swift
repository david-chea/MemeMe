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
    
    var meme: Meme
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Image(uiImage: meme.memedImage)
            Text("\(meme.topText) \(meme.bottomText)")
        }
    }
}
