//
//  ContentView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import SwiftUI

struct ContentView: View {
    
    var columns: [GridItem] = [GridItem(), GridItem(),GridItem(),GridItem()]
    var body: some View {
        LazyVGrid(columns: columns) {
        ForEach(1...14, id: \.self) { card in
            CardView()
        }
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
