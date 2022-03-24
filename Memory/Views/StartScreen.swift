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
    @State private var navigateHome: Bool = false
    @State private var navigateToPreviousScreen: Bool = false
    @State private var navigateToSettings: Bool = false
    @ObservedObject var viewModel = ScreenNavigationViewModel()
    
}

extension StartScreen {
    var body: some View {
        CustomNavigationView(destination: ChoiceScreen(screenViewModel: viewModel), isRoot: true, isLast: false) {
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
                .navigate(to: ChoiceScreen(screenViewModel: viewModel), when: $navigateToChoiceScreen)
        //        .navigate(to: viewModel.previousScreen.previousView(), when: $navigateToSettings, previousScreen: {
        //            viewModel.previousScreen = .startScreen })
        //        .navigate(to: StartScreen(viewModel: viewModel), when: $navigateHome, previousScreen: {
        //            viewModel.previousScreen = .startScreen })
        
    }
//}
}
