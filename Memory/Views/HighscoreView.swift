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
        
        ScrollView {
            Text("HIGH SCORE")
                .fontWeight(.bold)
                .font(.system(size: 32))
                .foregroundColor(Color.ForestTheme().secondaryColor)
        LazyVStack {
            ForEach(highscores, id: \.self) { highscore in
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.ForestTheme().complementaryColor)
                VStack {
                Text("Name:" + highscore.name!)
                Text("Score: \(highscore.score)")
                Text("Time: \(highscore.time)")
                }
                .padding()
            }
            }
        }
    }
        .background(Color.ForestTheme().backgroundColor).ignoresSafeArea()
    }

}
