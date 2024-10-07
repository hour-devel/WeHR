//
//  SignUp.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
//

import SwiftUI

struct SignUp: View {
    @State var textInput : String = ""
    var body: some View {
        GeometryReader{
            geo in
            ScrollView{
                VStack(alignment:.leading){
                    Text("Sign up").font(.system(size: 28,weight: .bold))
                    Text("Create an account to get started")
                    Text("Email Address")
                        .padding(.top,30)
                        .font(.system(size: 20,weight: .bold))
                    TextField("name@email.com", text: $textInput)
                        .font(.system(size: 20))
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
                    Button(action:{}){
                        Text("Send OTP Code")
                            .foregroundStyle(.white)
                            .font(.system(size:20,weight: .semibold))
                    }
                    .frame(minWidth: 300,maxWidth: geo.size.width,maxHeight: 60)
                    .background(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                    .cornerRadius(10)
                    .padding(.top,30)
                    Spacer()
                }
                .padding(.top,100)
                .padding(.horizontal,25)
                .frame(minWidth: 300,maxWidth: geo.size.width,minHeight: 400,maxHeight: geo.size.height)
                .background(.white)
            }.scrollDisabled(true)
        }
    }
}
