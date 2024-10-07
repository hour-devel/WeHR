//
//  Font.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct CustomFontModifier: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("Roboto-Regular", size: size))
    }
}

extension View {
    func customFont(size: CGFloat) -> some View {
        self.modifier(CustomFontModifier(size: size))
    }
}

