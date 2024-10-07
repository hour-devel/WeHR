//
//  ListAttendecesView.swift
//  WeHR
//
//  Created by Ly Nita on 6/10/24.
//

import SwiftUI

struct ListAttendecesComponent:View {
    var attendance: Attendance
    var body: some View {
        VStack{
            HStack(spacing: 60){
                VStack(alignment: .leading,spacing: 15){
                    Text(attendance.date)
                        .font(.system(size: 13))
                        .bold()
                    HStack(spacing: 10){
                        Image(attendance.imageName)
                            .resizable()
                            .frame(width: 15,height: 14)
                            .frame(width: 32,height: 32)
                            .background(Color(red: 0.863, green: 0.923, blue: 1.0))
                            .cornerRadius(10)
                        VStack(alignment: .leading,spacing: 3){
                            Text(attendance.time)
                                .font(.system(size: 11))
                            Text(attendance.description)
                                .foregroundStyle(Color(red: 0.999, green: 0.609, blue: 0.0))
                                .font(.system(size: 11))
                                .bold()
                        }
                    }
                }
                VStack(alignment: .leading,spacing: 15){
                    Text(attendance.date)
                        .font(.system(size: 13))
                        .bold()
                    HStack(spacing: 10){
                        Image(attendance.imageName)
                            .resizable()
                            .frame(width: 15,height: 14)
                            .frame(width: 32,height: 32)
                            .background(Color(red: 0.863, green: 0.923, blue: 1.0))
                            .cornerRadius(10)
                        VStack(alignment: .leading,spacing: 3){
                            Text(attendance.time)
                                .font(.system(size: 11))
                            Text(attendance.description)
                                .foregroundStyle(Color(red: 0.999, green: 0.609, blue: 0.0))
                                .font(.system(size: 11))
                                .bold()
                        }
                    }
                }
            }
        }
        .frame(width: 370,height: 89)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 0.2)
        )
        .background(
            HStack {
                Rectangle()
                    .fill(Color(red: 0.999, green: 0.609, blue: 0.0))
                    .frame(width: 10)
                Spacer()
            }
        )
        .cornerRadius(15)
    }
}
