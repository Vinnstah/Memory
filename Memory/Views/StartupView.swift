//
//  ChooseSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct StartupView: View {
//    @ObservedObject var viewModel: CardsViewModel
    @State var symbolSet: SymbolSet = .animals
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
//                HStack {
//                    VStack {
//
//                        Image(systemName: "number.square")
//                            .resizable()
//                            .frame(width: 100, height: 100, alignment: .center)
//                            .padding()
//                        Button(action: {
//                            symbolSet = .numbers
//                        }, label: {
//                            SymbolsetButtonView(buttonName: "Numbers")
//                        })
//                    }.border(symbolSet == .numbers ? Color.blue : Color.clear, width: 2 )
//
//                    VStack {
//                        Image(systemName: "hare")
//                            .resizable()
//                            .frame(width: 100, height: 100, alignment: .center)
//                            .padding()
//                        Button(action: {
//                            symbolSet = .animals
//                        }, label: {
//                            SymbolsetButtonView(buttonName: "Animals")
//                        })
//                    }.border(symbolSet == .animals ? Color.blue : Color.clear, width: 2 )
//
//                }
                
                Picker("Choose Symbol Set", selection: $symbolSet) {
                    ForEach(SymbolSet.allCases) { symbolSet in
                        VStack {
                            symbolSet.image
                            Text("\(String(describing: symbolSet))").tag(symbolSet)
                            
                        }
                    }
                }.pickerStyle(.segmented)
                
                Spacer()
                NavigationLink(destination: GameView(viewModel: CardsViewModel.init(symbolSet: symbolSet))) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 200, height: 50)
                        Text("Start Game")
                            .foregroundColor(.white)
                    }}
            }
        }}
}


private extension SymbolSet {
    var image: Image {
        switch self {
            
        }
    }
}
