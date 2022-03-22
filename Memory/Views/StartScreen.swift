//
//  StartScreen.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct StartScreen: View {
    
    @State private var highscoreIsShowing = false
    @State private var navigateToChoiceScreen = false
    
}

extension StartScreen {
    var body: some View {
        
        ZStack {
            AnimatedBackground()
            VStack {
                TopBarViewFragment()
                    .ignoresSafeArea()
                
                Spacer()
                
                Button(action: {
                    navigateToChoiceScreen.toggle()
                    
                }, label: {
                    Text("Start Game")
                })
                    .buttonStyle(.primary)
                    .padding()
                
                Button(action: {
                    highscoreIsShowing.toggle()
                    
                }, label: {
                    Text("Highscore")
                })
                    .buttonStyle(.primary)
                    .padding()
                
                Spacer()
            }
        }
        .background(Color.ForestTheme().backgroundColor.ignoresSafeArea())
        
        .sheet(isPresented: $highscoreIsShowing, content: {
            HighscoreView()
        })
        .navigate(to: ChoiceScreen(), when: $navigateToChoiceScreen)
    }
    
}
