//
//  ScoreView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-20.
//
//
import SwiftUI

struct TimeElapsedView: View {
    
   var timer: Int
    
    var body: some View {
        HStack {
            Spacer()
    Text("Time: \(timer)")
                .font(.system(size: 12))
            .foregroundColor(Color.ForestTheme().complementaryColor)
    }
    }
}
