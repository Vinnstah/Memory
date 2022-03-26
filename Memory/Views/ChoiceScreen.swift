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
    @ObservedObject var screenViewModel: ScreenNavigationViewModel
    @State var symbolSet: SymbolSet = .numbers
    @State private var name: String = ""
    @State private var navigateToGameView: Bool = false
    
    
    var body: some View {
        
        CustomNavigationView(destination:
                                GameView(
                                    CardsViewModel:CardsViewModel.init(symbolSet: symbolSet, name: name),
                                    CardCustomViewModel: viewModel
                                ),
                             isRoot: false,
                             isLast: false) {
            VStack {
                
                Text("Choose your Symbol")
                    .font(.system(size: 28))
                    .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
                
                
                LazyVGrid(columns: .init(
                    repeating: .init(.flexible()),
                    count: 2)) {
                        ForEach(SymbolSet.allCases) { symbolSet in
                            SymbolButton(
                                image: symbolSet.image,
                                symbolSet: symbolSet,
                                selectedButton: $symbolSet
                            )
                            
                        }
                    }
                
                Spacer()
                
                TextFieldView(name: $name)
                
                Spacer()
                
                Button(action: {
                    navigateToGameView.toggle()
                    
                }, label: {
                    Text("Start Game")
                })
                    .buttonStyle(.primary)
                    .padding(.bottom, 25)
                
                NavigationLink(
                    destination: GameView(CardsViewModel: CardsViewModel.init(symbolSet: symbolSet, name: name), CardCustomViewModel: viewModel).navigationBarHidden(true)
                        .navigationBarHidden(true),
                    isActive: self.$navigateToGameView,
                    label: {
                        //no label
                    })
                
                
            }
            .background(Color.ForestTheme().backgroundColor)
        }
        .navigationBarHidden(true)
    }
}
