//
//  ChooseSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct StartupView: View {
    @ObservedObject var viewModel = CardCustomizationViewModel()
    @State private var symbolSet: SymbolSet = .numbers
    
    init(){
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemTeal
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose your Symbol")
                    .font(.system(size: 28))

                HScrollView {
                    HStack {
                        ForEach(SymbolSet.allCases) { symbolSet in
                            VStack {
                                
                                symbolSet.image
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                Picker("Choose your symbol", selection: $symbolSet) {
                                    
                                    Text("\(String(describing: symbolSet).uppercased())").tag(symbolSet)
                                    
                                }

                        }
                    }
                    .pickerStyle(.segmented)
                }
                }
                Spacer()
                
                HStack {
                    VStack {
                        Text("Card Up Color")
                        Circle().fill().foregroundColor(viewModel.faceUpColor)
                            .overlay(ColorPicker("",
                                                 selection: $viewModel.faceUpColor).labelsHidden().opacity(0.015))
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    .padding()

                    
                    VStack {
                        Text("Card Down Color")
                            .font(.subheadline)
                        Circle().fill().foregroundColor(viewModel.faceDownColor)
                            .overlay(ColorPicker("",
                                                 selection: $viewModel.faceDownColor).labelsHidden().opacity(0.015))
                            .frame(width: 100, height: 100, alignment: .center)
                        
                    }
                    .padding()
                    
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: GameView(CardsViewModel: CardsViewModel.init(symbolSet: symbolSet), CardCustomViewModel: viewModel)) {
                    Text("Start Game")
                    
                }
                .buttonStyle(.primary)
                .padding()
            }
        }}
}



