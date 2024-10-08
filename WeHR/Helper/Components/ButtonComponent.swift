//
//  ButtonComponent.swift
//  WeHR
//
//  Created by Lihour on 10/1/24.
//

import SwiftUI

struct ButtonComponent: View {
    @State var action :() -> ()
    @State var content: String
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Spacer()
            Text("\(content)")
//                .font(.system(.title3, design: .rounded))
                .customFontBold(size: 16)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
        })
        .padding(15)
        .background(Color(hex: "primary"))
        .cornerRadius(10)
        .padding(.vertical)
    }
}


