//
//  OTPModifier.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
//

import SwiftUI
import Combine

// Modifier for limiting input and styling text fields
struct OTPModifier: ViewModifier {
    @Binding var pin: String
    var textLimit: Int = 1
    var isFocused: Bool // Added to handle focus state

    func limitText(_ upper: Int) {
        if pin.count > upper {
            pin = String(pin.prefix(upper))
        }
    }

    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) { _ in limitText(textLimit) }
            .frame(width: 45, height: 45)
            .background(Color.white.cornerRadius(5))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(isFocused ? Color.blue : Color.gray, lineWidth: 2) // Change color based on focus
            )
    }
}

