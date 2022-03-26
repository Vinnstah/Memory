//
//  OverlayView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-24.
//

import SwiftUI

struct TextFieldView: View  {
    
    @Binding var name: String
    
    var body: some View {
        VStack {
        Text("Choose your name")
            .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
            .font(.system(size: 24))
            .fontWeight(.bold)
        TextField("Your name...", text: $name)
                .textFieldStyle(.roundedBorder)
            .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
            .background(PrimaryButtonStyle.defaultColorTheme.backgroundColor)
            .font(.system(size: 28))
        }
        .padding()
    }
}


