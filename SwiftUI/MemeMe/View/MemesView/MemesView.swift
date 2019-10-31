//
//  MemesView.swift
//  MemeMe
//
//  Created by David Chea on 28/10/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import SwiftUI

struct MemesView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var data: Data
    
    @State private var isShowingAddMemeView = false
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                List {
                    ForEach(data.memes) { meme in
                        MemeRow(meme: meme)
                    }
                }
                .navigationBarTitle("Sent Memes")
                .navigationBarItems(trailing: addButton)
                
                Spacer()
            }
        }
    }
    
    var addButton: some View {
        Button(action: { self.isShowingAddMemeView.toggle() }) {
            Image(systemName: "plus.rectangle")
                .imageScale(.large)
        }
        .sheet(isPresented: $isShowingAddMemeView) {
            AddMemeView()
                .environmentObject(self.data)
        }
    }
}

struct MemesView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            MemesView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
