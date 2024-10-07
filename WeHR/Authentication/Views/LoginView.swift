//  Login.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.

import SwiftUI

struct LoginView: View {
    @State var email : String = ""
    @State var password : String = ""
    @State var isSignUp = false
    @State var isLogin = false
    
    func handleLogin(){
        isLogin = true
    }
    
    var body: some View {
        NavigationStack{
            GeometryReader{
                geo in
                ScrollView{
                    VStack(spacing:0){
                        VStack(spacing:10){
                            Image("KosignLogo")
                            HStack{
                                Text("Welcome to")
                                Text("My HR").foregroundStyle(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                            }/*.font(.system(size: 24,weight: .bold))*/
                            .customFontBold(size: 24)
                            Text("Please enter your account here")
                        }
                        .frame(minWidth: 300,maxWidth: geo.size.width,maxHeight: 200)
                        .background(.white)
                        VStack(alignment:.trailing, spacing: -40){
                            InputComponent(textInput: $email,placeHolder: GoogleAuthentication.share.isLoggedIn ? GoogleAuthentication.share.givenName : "Enter your email")
                            SecureComponent(password:$password)
                            Text("Forgot password ?")
                                .font(.system(size: 18,weight: .semibold))
                                .foregroundStyle(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                                .padding(.bottom,10)
                        }
                        .padding(.top,30)
                        .padding(.horizontal,30)
                        .frame(minWidth: 300,maxWidth: geo.size.width,maxHeight: 250)
                        .background(.white)
                        VStack{
                            //login button
                            ButtonComponent(action: {
                                handleLogin()
                            }, content: "Login")
                            //
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 1)
                                .padding(.vertical,30)
                                .foregroundColor(Color(red: 107 / 255, green: 114 / 255, blue: 128 / 255, opacity: 1.0))
                                .overlay{
                                    Text("OR SIGN IN WITH")
                                        .font(.system(size: 14))
                                        .padding(.horizontal)
                                        .background(.white)
                                        .foregroundColor(Color(red: 107 / 255, green: 114 / 255, blue: 128 / 255, opacity: 1.0))
                                }
                            //google login
                            Button(action:{
                                GoogleAuthentication.share.signinWithGoogle(presenting: getRootViewController()){
                                    error in
                                    print("Error :",error!)
                                }
                            }){
                                RoundedRectangle(cornerRadius: 50)
                                    .foregroundColor(Color(red: 243 / 255, green: 248 / 255, blue: 255 / 255, opacity: 1.0))
                                    .frame(width: 70,height: 70)
                                    .shadow(radius: 5)
                                    .overlay{
                                        Image("GoogleLogo")
                                            .resizable()
                                            .frame(width: 40,height: 40)
                                    }
                            }
                        }
                        .padding(.top,30)
                        .padding(.horizontal,30)
                        .frame(minWidth: 300,maxWidth: geo.size.width,maxHeight: 250)
                        .background(.white)
                        HStack{
                            Text("Don't have an account?")
                            Button(action:{isSignUp = true}){
                                Text("Sign up now")
                                    .foregroundStyle(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                                    .font(.system(size: 18,weight: .semibold))
                                    .underline()
                            }
                        }.offset(y:50)
                    }
                    .frame(minWidth: 300,maxWidth: geo.size.width,minHeight: 800,maxHeight: geo.size.height)
                    .background(.white)
                }.scrollDisabled(true)
            }
            .navigationDestination(isPresented: $isLogin){
                WeHRView()
            }
            .navigationDestination(isPresented: $isSignUp){
                SignUpView()
            }
        }
    }
}
#Preview{
    LoginView()
}
