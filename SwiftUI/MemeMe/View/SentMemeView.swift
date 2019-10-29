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
    
    @State private var isShowingAddMemeView = false
    
    // MARK: - Views
    
    var body: some View {
        NavigationView {
            TabView {
                Text("List")
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .imageScale(.large)
                    }
                Text("Collection")
                    .tabItem {
                        Image(systemName: "table")
                            .imageScale(.large)
                    }
            }
            .navigationBarTitle("Sent Memes")
            .navigationBarItems(trailing: addButton)
        }
    }
    
    var addButton: some View {
        Button(action: { self.isShowingAddMemeView.toggle() }) {
            Image(systemName: "plus.rectangle")
                .imageScale(.large)
        }
        .sheet(isPresented: $isShowingAddMemeView) {
            AddMemeView()
        }
    }
}

struct SentMemeView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            SentMemeView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
