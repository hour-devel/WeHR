//
//  SignUp.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
//

import SwiftUI

struct SignUpView: View {
    @State var textInput : String = ""
    @State var isVerify = false
    
    func verifyOTP(){
        isVerify = true
    }
    
    var body: some View {
        NavigationStack{
            GeometryReader{
                geo in
                ScrollView{
                    VStack(alignment:.leading){
                        Text("Sign up")
                            .customFontBold(size: 28)
                        Text("Create an account to get started")
                            .customFont(size: 16)
                        Text("Email Address")
                            .padding(.top,30)
                            .customFontBold(size: 20)
                        TextField("name@email.com", text: $textInput)
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
                        ButtonComponent(action: {
                            verifyOTP()
                        }, content: "Send OTP Code")
                        Spacer()
                        
                    }
                    .padding(.top,100)
                    .padding(.horizontal,25)
                    .frame(minWidth: 300,maxWidth: geo.size.width,minHeight: 400,maxHeight: geo.size.height)
                    .background(.white)
                }
                .scrollDisabled(true) 
            }.navigationDestination(isPresented: $isVerify){
                OTPView()
            }
        }
    }
}

#Preview {
    SignUpView()
}
