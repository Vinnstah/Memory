//
//  StartScreen.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct StartScreen: View {
    @State private var highscoreIsShowing = false
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color.ForestTheme().backgroundColor.ignoresSafeArea()
                VStack {
                    NavigationLink(destination: GameView(CardsViewModel: CardsViewModel.init(symbolSet: SymbolSet.animals), CardCustomViewModel: CardCustomizationViewModel())) {
                        Text("Start Game")
                        
                    }
                    
                    .buttonStyle(.primary).foregroundColor(.ForestTheme().primaryColor)
        
        

                
                Button(action: {
                    highscoreIsShowing.toggle()
                }, label: {Text("Highscore")})

                }
      
            }
        }
        .sheet(isPresented: $highscoreIsShowing, content: {HighscoreView()})
    }
}

