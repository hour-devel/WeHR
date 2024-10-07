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



struct CustomFontMediumModifier: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("Roboto-Medium", size: size))
    }
}
extension View {
    func customFont(size: CGFloat) -> some View {
        self.modifier(CustomFontModifier(size: size))
    }
    func customFontMedium(size: CGFloat) -> some View {
        self.modifier(CustomFontMediumModifier(size: size))
    }
}
