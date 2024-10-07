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
        VStack(alignment: .leading, spacing: 13) {
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
                HStack {
                    HStack {
                        Text("Search here")
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 0.29, green: 0.335, blue: 0.389))
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 13, height: 14)
                    }
                    .padding()
                    .frame(maxWidth: .infinity,maxHeight: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(hue: 0.594, saturation: 0.237, brightness: 0.987).opacity(0.4), lineWidth: 1.0)
                    )
                    .background(
                        HStack {
                            Rectangle()
                                .fill(Color(red: 0.953, green: 0.973, blue: 0.999))
                        }
                        .cornerRadius(15)
                    )
                    HStack {
                        Button(action: {
                            showFilter = true
                        }, label: {
                            Image("filter")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Filter")
                                .foregroundColor(.black)
                                .font(.subheadline)
                        })
                        .sheet(isPresented: $showFilter) {
                            FilterComponent(isPresented: $showFilter)
                                .presentationDetents([.height(590), .large])
                                .presentationContentInteraction(.scrolls)
                        }
                    }
                }
                SelectDateComponent()
            }
            Text("List Attendance")
                .font(.subheadline)
                .bold()
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


