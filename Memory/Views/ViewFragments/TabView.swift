//
//  TabView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-26.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var viewModel = CardsViewModel(name: "")
    
    init() {
    UITabBar.appearance().backgroundColor = UIColor(Color.ForestTheme().secondaryBackgroundColor)
    
    }
    
    var body: some View {
        
        TabView {
            StartScreen(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            
            HighscoreView()
                .tabItem {
                    Label("High Score", systemImage: "list.bullet.rectangle.portrait")
                }

            
            ChoiceScreen(viewModel: viewModel)
                .tabItem {
                    Label("Choice Screen", systemImage: "square.grid.3x3")
                }

            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }

            
        }
        .accentColor(
            Color.ForestTheme().complementaryColor
        )
    }
}

