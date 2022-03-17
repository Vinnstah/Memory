//
//  Extension+ButtonStyle.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-17.
//

import Foundation
import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
        
    public static let defaultCornerRadius: CGFloat = 8
    private let cornerRadius: CGFloat
    private var isLoading: Bool

    public init(
        isLoading: Bool = false,
        cornerRadius: CGFloat = Self.defaultCornerRadius
    ) {
        self.isLoading = isLoading
        self.cornerRadius = cornerRadius
    }
    
    public func makeBody(configuration: Configuration) -> some View {
//        Group {
//            if isLoading {
//                ActivityIndicator()
//                    .frame(size: 30)
//                    .foregroundColor(.white)
//            } else {
                configuration.label
            .font(.title2)
            .foregroundColor(isEnabled ? Color.white : .gray)

//            }
//        }
        .frame(maxWidth: .infinity, idealHeight: 50)
            .padding()
            .background(isEnabled ? Color.teal : .gray)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

public extension ButtonStyle where Self == PrimaryButtonStyle {

    /// A button style that applies the call to the **primary** action of the
    /// current screen, rounded with the default corner radious.
    ///
    /// To apply this style to a button, or to a view that contains buttons, use
    /// the ``View.buttonStyle(_:)`` modifier.
    static var primary: PrimaryButtonStyle {
        Self.primary(cornerRadius: PrimaryButtonStyle.defaultCornerRadius)
    }
    
    /// A button style that applies the call to the **primary** action of the
    /// current screen.
    ///
    /// To apply this style to a button, or to a view that contains buttons, use
    /// the ``View.buttonStyle(_:)`` modifier.
    static func primary(
        isLoading: Bool = false,
        cornerRadius: CGFloat = PrimaryButtonStyle.defaultCornerRadius
    ) -> PrimaryButtonStyle {
        .init(isLoading: isLoading, cornerRadius: cornerRadius)
    }
}
