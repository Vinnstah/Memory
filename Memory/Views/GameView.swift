//
//  GridView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct GameView: View {
    
    @ObservedObject var CardsViewModel: CardsViewModel
    @Environment(\.managedObjectContext) var moc
    
}

extension GameView {
    
    var body: some View {
        
        CustomNavigationView(
            destination: EmptyView(),
            isRoot: false,
            isLast: true,
            timer: CardsViewModel.timeElapsed,
            timesClicked: CardsViewModel.numberOfFlips
        ) {
            GeometryReader { geometry in
                
                VStack {
                    
                    LazyVGrid(columns: CardsViewModel.columns, spacing: 10) {
                        ForEach($CardsViewModel.cards, id: \.self) { $card in
            
                            CardView(
                                card: card,
                                isFlipped: card.checkIfIsFlipped(),
                                onTapAction: {
                                    CardsViewModel.didTapCard(card: card)
                                    
                                },
                                faceDownColor: Color.ForestTheme().primaryColor,
                                faceUpColor: Color.ForestTheme().complementaryColor
                            )
                                .frame(height: geometry.size.height * 0.8 / CGFloat(CardsViewModel.rowCount))
                            
                        }
                        
                    }
                   
                    
                    Spacer()
                    
                    Button("Restart Game")
                    {
                        CardsViewModel.clearVariablesAndRestartGame()
                    }
                    .buttonStyle(.primary)
                    
                }
                .padding()
                .navigationBarHidden(true)
            }
            
            .onReceive(CardsViewModel.timer) { time in
                CardsViewModel.timeElapsed += 1
            }
            
            .alert(isPresented: $CardsViewModel.allSymbolsAreMatched) {
                Alert(title: Text("YOU WON"), message: Text("Your total number of flips were \(CardsViewModel.numberOfFlips), and was achieved in \(CardsViewModel.timeElapsed) seconds"), primaryButton: .default(Text("Save Highscore"), action: {
                    let highscore = Highscore(context: moc)
                    highscore.name = "\(CardsViewModel.name)"
                    highscore.id = UUID()
                    highscore.score = Int16(CardsViewModel.numberOfFlips)
                    highscore.time = Int16(CardsViewModel.timeElapsed)
                    
                    try? moc.save()
                    
                }), secondaryButton: .destructive(Text("Don't Save")))
                
            }
            .background(Color.ForestTheme().backgroundColor)
            
        }
    }
}

