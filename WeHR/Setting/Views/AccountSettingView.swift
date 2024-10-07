//
//  AccountSettingView.swift
//  WeHR
//
//  Created by Phal Madina on 6/10/24.
//

import SwiftUI

struct AccountSettingView: View {
    @State var isSelect: Bool = true
    var body: some View {
        GeometryReader{ geometry in
            NavigationView{
                VStack(alignment: .center){
                    NavigationLink(destination: ProfileView()){
                        ZStack{
                            HStack{
                                Image(.profile)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(.circle)
                                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0), lineWidth: 2)
                                    )
                                VStack(alignment: .leading, spacing: 2){
                                    Text("Louis Vuitton")
                                        .foregroundColor(Color(red: 9 / 255, green: 9 / 255, blue: 32 / 255, opacity: 1.0))
                                        .font(.system(size: 16, weight: .semibold))
                                    Text("louisvuitton@gmail.com")
                                        .accentColor(Color(red: 75 / 255, green: 85 / 255, blue: 99 / 255, opacity: 1.0))
                                        .font(.system(size: 13))
                                    
                                }
                                .padding(.leading, 8)
                                Spacer()
                                Image(.arrow)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 7, height: 12)
                            }
                            .padding(.horizontal, 20)
                            .frame(minWidth: 200, maxWidth: geometry.size.width * 0.9,maxHeight:85)
                            .background(Color(red: 243 / 255, green: 248 / 255, blue: 255 / 255, opacity: 1.0))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 63 / 255, green: 97 / 255, blue: 235 / 255, opacity: 1.0), lineWidth: 2)
                            )
                        }
                        .padding([.bottom, .top], 30)
                    }
                    
                    // Polocies and Setting
                    VStack(alignment: .leading){
                        Text("Policies")
                            .font(.system(size: 16, weight: .semibold))
                            .bold()
                            .padding(.bottom, 10)
                        AccountSectionComponent(title: "Roles and Policies", content: "information of leave policies", icon: "gavel")
                            .padding(.bottom, 30)
                        Text("Settings")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.bottom, 10)
                        AccountSectionComponent(title: "Application Language", content: "choose your each languages", icon: "globle", image: "flat")
                            .padding(.bottom, 30)
                    }
                    Toggle(isOn: $isSelect, label: {
                        HStack {
                            Image("notification")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 30)
                            Text("Notification")
                                .font(.system(size: 16, weight: .semibold))
                        }
                    })
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.06)
                    Spacer()
                    
                    Button(action: {
                        // Your logout action here
                        print("Logout tapped")
                    }) {
                        AccountButton(title: "Logout")
                    }
                    .frame(minWidth: 300, maxWidth: geometry.size.width * 0.9)
                    .padding(.bottom, 30)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("My Account")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: HStack {
                        NavigationLink(destination: SummaryView()){
                                    Image("arrowbackward")
                                        .resizable()
                                        .frame(width: 12, height: 20)
                                }
                    }
                )
//                .navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    AccountSettingView()
}
