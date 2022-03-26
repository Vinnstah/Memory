//
//  TabView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-26.
//

import SwiftUI

struct CustomTabView: View {
    
    init() {
    UITabBar.appearance().backgroundColor = UIColor(Color.ForestTheme().secondaryBackgroundColor)
    }
    
    var body: some View {
        
        TabView {
            StartScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tint(
                    Color.ForestTheme().complementaryColor
                )
            
            HighscoreView()
                .tabItem {
                    Label("High Score", systemImage: "list.bullet.rectangle.portrait")
                }
                .tint(
                    Color.ForestTheme().complementaryColor
                )
            
            ChoiceScreen(screenViewModel: ScreenNavigationViewModel())
                .tabItem {
                    Label("Choice Screen", systemImage: "square.grid.3x3")
                }
                .tint(
                    Color.ForestTheme().complementaryColor
                )
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tint(
                    Color.ForestTheme().complementaryColor
                )
            
        }
        .accentColor(
            Color.ForestTheme().complementaryColor
        )
    }
}

