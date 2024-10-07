//
//  SelectDateView.swift
//  WeHR
//
//  Created by Ly Nita on 6/10/24.
//

//import SwiftUI
//
//struct SelectDateComponent: View {
//    var body: some View {
//        HStack {
//            Text("Select Date :")
//                .font(.footnote)
//                .bold()
//            Spacer()
//            VStack{
//                Text("Jan 01,2024 -Feb 01,2024")
//                    .foregroundStyle(Color(red: 0.243, green: 0.38, blue: 0.915))
//                    .font(.system(size: 13))
//                    .bold()
//            }
//            .frame(width: 185, height: 30)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color(red: 0.243, green: 0.38, blue: 0.915), lineWidth: 1)
//            )
//            Spacer()
//            HStack{
//                Image("Sheet")
//                    .resizable()
//                    .frame(width: 22, height: 23)
//                Text("Download")
//                    .font(.caption2)
//                    .bold()
//            }
//            .padding(.vertical, 20)
//        }
//    }
//}

import SwiftUI

struct SelectDateComponent: View {
    var body: some View {
        HStack {
            Text("Select Date :")
                .font(.footnote)
                .bold()
                .frame(minWidth: 80, alignment: .leading)
            Spacer()
            Text("Jan 01, 2024 - Feb 01, 2024")
                .foregroundColor(Color(red: 0.243, green: 0.38, blue: 0.915))
                .font(.system(size: 13))
                .bold()
                .padding(.horizontal, 10)
                .frame(minHeight: 30)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.243, green: 0.38, blue: 0.915), lineWidth: 1)
                )
            Spacer()
            HStack {
                Image("Excel")
                    .resizable()
                    .frame(width: 22, height: 23)
                Text("Download")
                    .font(.caption)
                    .bold()
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SelectDateComponent()
}
