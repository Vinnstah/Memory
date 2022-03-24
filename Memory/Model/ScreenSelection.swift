//
//  ScreenSelection.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-24.
//

import Foundation
import SwiftUI

enum Screen: Equatable {
    case startScreen, choiceScreen, highScore, gameView
    
    func previousView() -> some View {
        switch self {
        case .startScreen: return AnyView(StartScreen())
        case .choiceScreen: return AnyView(ChoiceScreen(screenViewModel: ScreenNavigationViewModel()))
        case .gameView: return AnyView(HighscoreView())
        case .highScore: return AnyView(HighscoreView())
        }
    }
    
}
