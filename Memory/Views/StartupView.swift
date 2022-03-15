//
//  ChooseSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct StartupView: View {
    @ObservedObject var viewModel: CardsViewModel
    
    var body: some View {
        NavigationView {
        VStack {
            HStack {
                Button(action: {
                    viewModel.symbolSet = [Card.Symbol.Stripped.numbers.description]
                }, label: {
                    Text("Numbers")
                })
                Button(action: {
                    viewModel.symbolSet = [Card.Symbol.Stripped.animals.description]
                }, label: {
                    Text("Animals")
                })
                
            }
            
            NavigationLink(destination: GameView(viewModel: CardsViewModel(symbols: .init(), symbolSet: viewModel.symbolSet))) {
           
                Text("Start Game")
            }
        }
        }}
}



