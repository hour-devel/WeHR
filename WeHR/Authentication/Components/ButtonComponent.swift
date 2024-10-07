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
                .font(.system(.title3, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
        })
        .padding(15)
        .background(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
        .cornerRadius(10)
        .padding(.vertical)
    }
}


