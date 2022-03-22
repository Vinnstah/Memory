//
//  ChooseSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct ChoiceScreen: View {
    @ObservedObject var viewModel = CardCustomizationViewModel()
    @State var symbolSet: SymbolSet = .numbers
    @State private var name: String = ""
    
    init(){
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemTeal
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    var body: some View {
        
            VStack {
                TopBarViewFragment()
                    .ignoresSafeArea()
                Text("Choose your Symbol")
                    .font(.system(size: 28))
                    .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)

//                HScrollView {
                    LazyVGrid(columns: .init(
                        repeating: .init(.flexible()),
                        count: 2)) {
                        ForEach(SymbolSet.allCases) { symbolSet in
                            SymbolButton(image: symbolSet.image, symbolSet: symbolSet)
                        }
                    }
//                    .pickerStyle(.segmented)
//                }
                Spacer()
                
                Text("Choose your name")
                    .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                TextField("Your name...", text: $name)
                    .foregroundColor(PrimaryButtonStyle.defaultColorTheme.primaryColor)
                    .background(PrimaryButtonStyle.defaultColorTheme.complementaryColor)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: GameView(CardsViewModel: CardsViewModel.init(symbolSet: symbolSet, name: name), CardCustomViewModel: viewModel)) {
                    Text("Start Game")
                    
                }
                .buttonStyle(.primary)
                .padding()
                
                
                
            }
            .background(Color.ForestTheme().backgroundColor)
    }
        }




//                HStack {
//                    VStack {
//                        Text("Card Up Color")
//                        Circle().fill().foregroundColor(viewModel.faceUpColor)
//                            .overlay(ColorPicker("",
//                                                 selection: $viewModel.faceUpColor).labelsHidden().opacity(0.015))
//                            .frame(width: 100, height: 100, alignment: .center)
//                    }
//                    .padding()
//
//                    
//                    VStack {
//                        Text("Card Down Color")
//                            .font(.subheadline)
//                        Circle().fill().foregroundColor(viewModel.faceDownColor)
//                            .overlay(ColorPicker("",
//                                                 selection: $viewModel.faceDownColor).labelsHidden().opacity(0.015))
//                            .frame(width: 100, height: 100, alignment: .center)
//
//                    }
//                    .padding()
//                    
//                }
//                .padding()
