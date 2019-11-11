//
//  MemeData.swift
//  MemeMe
//
//  Created by David Chea on 30/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

final class MemeData: ObservableObject {
    
    @Published var memes = [Meme]()
}
