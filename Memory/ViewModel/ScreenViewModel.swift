//
//  ScreenViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-24.
//

import Foundation

final class ScreenNavigationViewModel: ObservableObject {
    @Published var previousScreen: Screen = .startScreen
    
}
