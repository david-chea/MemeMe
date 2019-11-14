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
    
    @EnvironmentObject private var memeData: MemeData
    
    @State private var isShowingAddMemeView = false
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memeData.memes) { meme in
                    NavigationLink(destination: MemeDetailView(memeImage: meme.memeImage)) {
                        MemeRow(meme: meme)
                    }
                }
            }
            .padding(.top)
            .navigationBarTitle("Sent Memes")
            .navigationBarItems(trailing: addButton)
        }
    }
    
    var addButton: some View {
        Button(action: { self.isShowingAddMemeView.toggle() }) {
            Image(systemName: "plus")
        }
        .sheet(isPresented: $isShowingAddMemeView) {
            AddMemeView()
                .environmentObject(self.memeData)
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
