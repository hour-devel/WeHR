//
//  SecureField.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
//

import SwiftUI

struct SecureComponent: View {
    @State private var isPasswordVisible = false
    @Binding var password:String
    var body: some View {
        GeometryReader{
            geo in
            ZStack {
                Group{
                    if isPasswordVisible {
                        TextField("\(Image("Password"))\t Enter your password", text: $password)
                    } else {
                        SecureField("\(Image("Password"))\t Enter your password", text: $password)
                    }
                }
                .customFont(size: 20)
                .padding(.horizontal , 15)
                .frame(minWidth: 300,maxWidth: geo.size.width,maxHeight: 40)
                .padding(.vertical,10)
                .background(Color(red: 249 / 255, green: 250 / 255, blue: 251 / 255, opacity: 1.0))
                .cornerRadius(10)
                .multilineTextAlignment(.leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 229 / 255, green: 231 / 255, blue: 235 / 255, opacity: 1.0), lineWidth: 1)
                )
                HStack {
                    Spacer()
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .font(.system(size: 20,weight: .bold))
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
