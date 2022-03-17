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
                Spacer()
                HStack {
                    VStack {
                        
                        Image(systemName: "number.square")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding()
                        Button(action: {
                            
                        }, label: {
                            SymbolsetButtonView(buttonName: "Numbers")
                        })
                    }
                    
                    VStack {
                        Image(systemName: "hare")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding()
                        Button(action: {
                            
                        }, label: {
                            SymbolsetButtonView(buttonName: "Animals")
                        })
                    }
                    
                }
                Spacer()
                NavigationLink(destination: GameView(viewModel: CardsViewModel())) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 200, height: 50)
                        Text("Start Game")
                            .foregroundColor(.white)
                    }}
            }
        }}
}



