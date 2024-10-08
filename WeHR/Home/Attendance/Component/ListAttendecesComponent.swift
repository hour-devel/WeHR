//
//  ListAttendecesView.swift
//  WeHR
//
//  Created by Ly Nita on 6/10/24.
//

import SwiftUI

struct ListAttendecesComponent: View {
    var attendance: Attendance

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(attendance.date)
                            .customFontMedium(size: 13)
                        HStack(spacing: 10) {
                            Image(attendance.imageName)
                                .resizable()
                                .frame(width: 15,height: 14)
                                .frame(width: 32,height: 32)
                                .background(Color(hex: "#2489FF").opacity(0.16))
                                .cornerRadius(10)

                            VStack(alignment: .leading, spacing: 3) {
                                Text(attendance.time)
                                    .customFont(size: 11)
                                Text(attendance.description)
                                    .foregroundStyle(Color(red: 0.999, green: 0.609, blue: 0.0))
                                    .customFont(size: 11)
                            }
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading,spacing: 15){
                        Text(attendance.date)
                            .customFontMedium(size: 13)
                        HStack(spacing: 10){
                            Image(attendance.imageName)
                                .resizable()
                                .frame(width: 15,height: 14)
                                .frame(width: 32,height: 32)
                                .background(Color(hex: "#2489FF").opacity(0.16))
                                .cornerRadius(10)
                            VStack(alignment: .leading,spacing: 3){
                                Text(attendance.time)
                                    .customFont(size: 11)
                                Text(attendance.description)
                                    .foregroundStyle(Color(red: 0.999, green: 0.609, blue: 0.0))
                                    .customFont(size: 11)
                            }
                        }
                    }
                }
                .padding(.horizontal,15)
                .padding()
                .frame(width: geometry.size.width * 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                .background(
                    HStack {
                        Rectangle()
                            .fill(
                                attendance.id % 2 == 0 ?
                                Color(red: 0.999, green: 0.609, blue: 0.0) :
                                    Color(red: 236 / 255, green: 34 / 255, blue: 31 / 255)
                            )
                            .frame(width: 10)
                        Spacer()
                    }
                )
                .cornerRadius(15)
            }
        }
        .frame(height: 80)
    }
}

