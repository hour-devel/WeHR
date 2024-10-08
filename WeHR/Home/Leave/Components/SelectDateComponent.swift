//
//  SelectDate.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//
import SwiftUI

struct SelectDateComponent: View {
    var body: some View {
        HStack {
            Text("Select Date :")
                .customFont(size: 14)
            Spacer()
            VStack{
                Text("Jan 01, 2024 -Feb 01, 2024")
                    .foregroundStyle(Color(red: 0.243, green: 0.38, blue: 0.915))
                    .customFontMedium(size: 13)
            }
            .frame(width: 280, height: 35)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.243, green: 0.38, blue: 0.915), lineWidth: 1)
            )
        }
    }
}

#Preview {
    SelectDateComponent()
}



