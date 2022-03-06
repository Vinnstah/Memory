//
//  ContentView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: CardVM

    var body: some View {
        GridView(viewModel: viewModel)
    }
}


