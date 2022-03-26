//
//  StartScreen.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct StartScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var highscoreIsShowing = false
    @State private var navigateToChoiceScreen = false
    @ObservedObject var viewModel: CardsViewModel
    
}

extension StartScreen {
    var body: some View {
        CustomNavigationView(destination: ChoiceScreen(viewModel: viewModel), isRoot: true, isLast: false) {
            ZStack {
                AnimatedBackground()
                VStack {
                    
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
                        Text("High Score")
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
        }
        .navigate(to: ChoiceScreen(viewModel: viewModel), when: $navigateToChoiceScreen)
        
    }
}
