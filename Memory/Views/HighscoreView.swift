//
//  HighscoreView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct HighscoreView: View {
    @FetchRequest(sortDescriptors: []) var highscores: FetchedResults<Highscore>
    
    var body: some View {
        List(highscores) { highscore in
            Text("Name:" + highscore.name!)
            Text("Score: \(highscore.score)")
            Text("Time: \(highscore.time)")
        }
    }
}




