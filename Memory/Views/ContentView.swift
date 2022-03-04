//
//  ContentView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import SwiftUI

struct ContentView: View {
    

    var body: some View {
        GridView(viewModel: CardsViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
