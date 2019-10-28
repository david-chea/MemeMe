//
//  SentMemeView.swift
//  MemeMe
//
//  Created by David Chea on 28/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct SentMemeView: View {
    
    // MARK: - Property
    
    /// Check if the sheet for adding a meme is presented.
    @State private var isAdding = false
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            TabView {
                Text("List")
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                
                Text("Collection")
                    .tabItem {
                        Image(systemName: "table")
                    }
            }
            .navigationBarTitle("Sent Memes")
            .navigationBarItems(trailing: Button(action: { self.isAdding.toggle() }) {
                Image(systemName: "plus.rectangle")
            })
        }
        .sheet(isPresented: $isAdding) {
            AddMemeView()
        }
    }
}

struct SentMemeView_Previews: PreviewProvider {
    
    static var previews: some View {
        SentMemeView()
    }
}
