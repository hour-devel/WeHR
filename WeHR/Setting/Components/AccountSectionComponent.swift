//
//  AccountSectionComponent.swift
//  WeHR
//
//  Created by Phal Madina on 6/10/24.
//

import SwiftUI

struct AccountSectionComponent: View {
    @State var title: String
    @State var content: String
    @State var icon: String
    @State var image: String?
    var body: some View {
            VStack(alignment: .center){
                ZStack{
                    HStack{
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30.7)
                        VStack(alignment: .leading){
                            Text(title)
                                .foregroundColor(Color(red: 9 / 255, green: 9 / 255, blue: 32 / 255, opacity: 1.0))
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.bottom, 2)
                            Text(content)
                                .foregroundColor(Color(red: 75 / 255, green: 85 / 255, blue: 99 / 255, opacity: 1.0))
                                .font(.system(size: 13))
                                
                        }
                        .padding(.leading, 8)
                        Spacer()
                        Image(image ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Image("angle-right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 7, height: 12)
                    }
                }
                .padding(.horizontal, 20)
                .frame(minWidth: 200, maxWidth: 384,maxHeight: 57)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 229 / 255, green: 231 / 255, blue: 233 / 255, opacity: 1.0), lineWidth: 2)
                )
            }
    }
}

//#Preview {
//    AccountSectionComponent()
//}
