//
//  MemeTextField.swift
//  MemeMe
//
//  Created by David Chea on 02/11/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct MemeTextField: View {
    
    // MARK: - Property
    
    @Binding var text: String
    
    // MARK: - View
    
    var body: some View {
        TextField("", text: $text, onEditingChanged: { isChanged in
            self.text = isChanged ? "" : self.text
        }) {}
        .autocapitalization(.allCharacters)
    }
}
