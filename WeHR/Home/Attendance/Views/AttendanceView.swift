//
//  AttendanceViewModel.swift
//  WeHR
//
//  Created by Ly Nita on 6/10/24.
//

import SwiftUI

struct AttendanceView: View {
    @StateObject private var attendances = AttendanceViewModel()
    @State private var showFilter = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(spacing: 20) {
                HStack {
                    Image("nita")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    Spacer()
                    Group {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Image(systemName: "bell.badge.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                HStack(spacing: 25){
                    HStack {
                        Button(action: {
                            showFilter = true
                        }, label: {
                            Image("filter")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Filter")
                                .foregroundColor(.black)
                                .customFontMedium(size: 16)
                        })
                        .sheet(isPresented: $showFilter) {
                            FilterComponent(isPresented: $showFilter)
                                .presentationDetents([.height(590), .large])
                                .presentationContentInteraction(.scrolls)
                        }
                    }
                    HStack {
                        Text("Search here")
                            .customFont(size: 14)
                            .foregroundColor(Color(hex: "#4B5563"))
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 13, height: 14)
                    }
                    .padding()
                    .frame(maxWidth: 294,maxHeight: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#EBEDFC"), lineWidth: 1.0)
                    )
                    .background(
                        HStack {
                            Rectangle()
                                .fill(Color(hex: "#F3F8FF").opacity(0.98))
                        }
                        .cornerRadius(10)
                    )
                }
                SelectDateComponent()
            }
            
            Text("List Attendance")
                .customFontMedium(size: 15)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(attendances.attendances) { attendance in
                        ListAttendecesComponent(attendance: attendance)
                    }
                }.padding(.bottom,40)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    AttendanceView()
}




