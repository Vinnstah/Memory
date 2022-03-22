//
//  TopBarViewFragment.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct TopBarViewFragment: View {
    
//    let back: @escaping () -> View
//    let home: () -> Void
//    let settings: () -> Void
    
    var body: some View {
        //        VStack {
        //            ZStack {
        //                RoundedRectangle(cornerRadius: 50)
        //                    .fill(Color.ForestTheme().secondaryBackgroundColor)
        //                    .ignoresSafeArea()
        //                    .frame(width: .infinity,
        //                           height: 50,
        //                           alignment: .top)
        //                HStack {
        //                    Button(action: {}, label: {Text("Text")})
        //                        .buttonStyle(RoundButton())
        //
        //                }
        //            }
        //            Spacer()
        //        }
        
        HStack {
            Button(action: {

            }, label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 35, height: 35)
                
            })
                .buttonStyle(RoundButton())
                .padding(.top)
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "house.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                
            })
                .buttonStyle(RoundButton())
                .padding(.top)
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 35, height: 35)
                
            })
                .buttonStyle(RoundButton())
                .padding(.top)
        }
        .padding()
        .foregroundColor(.white)
        .background(
            Color.ForestTheme().secondaryBackgroundColor.ignoresSafeArea(edges: .top)
        )
        .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
        
    }
}
