//
//  AnimatedBackgrounnd.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct AnimatedBackground: View {
    
    let timer = Timer.publish(
        every: 0.5,       // Second
        tolerance: 0.1, // Gives tolerance so that SwiftUI makes optimization
        on: .main,      // Main Thread
        in: .common     // Common Loop
    ).autoconnect()

    @State var offset: CGSize = .zero
    @State var offset2: CGSize = .zero
    @State var offset3: CGSize = .zero
}

extension AnimatedBackground {
    var body: some View {
        VStack {
            Circles(circleSize: 30, color: Color.ForestTheme().complementaryColor, offset: offset)

            Circles(circleSize: 50, color: Color.ForestTheme().secondaryColor, offset: offset2)

            Circles(circleSize: 40, color: Color.ForestTheme().primaryColor, offset: offset3)
               }.onReceive(timer) { (_) in
                   let widthBound = UIScreen.main.bounds.width
                   let heightBound = UIScreen.main.bounds.height / 5
                   let randomOffset = CGSize(
                       width: CGFloat.random(in: -widthBound...widthBound),
                       height: CGFloat.random(in: -heightBound...heightBound)
                   )
                   
                   let randomOffset2 = CGSize(
                       width: CGFloat.random(in: -widthBound...widthBound),
                       height: CGFloat.random(in: -heightBound...heightBound)
                   )
                   let randomOffset3 = CGSize(
                       width: CGFloat.random(in: -widthBound...widthBound),
                       height: CGFloat.random(in: -heightBound...heightBound)
                   )
                   withAnimation {
                       self.offset = randomOffset
                       self.offset2 = randomOffset2
                       self.offset3 = randomOffset3
                   }
               }
        
           }
           
    }



struct Circles: View {
    let circleSize: CGFloat
    let color: Color
    let offset: CGSize
    
    var body: some View {
    Circle().size(width: circleSize, height: circleSize)
            .fill(color)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(offset)
    }
}
