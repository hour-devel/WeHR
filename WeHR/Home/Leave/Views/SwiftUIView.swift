////
////  AttendanceViewModel.swift
////  WeHR
////
////  Created by Ly Nita on 6/10/24.
////
//
//import SwiftUI
//
//struct AttendanceView: View {
//
//    @State private var showFilter = false
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 13) {
//            VStack(spacing: 20) {
//                HStack {
//                    Image("minji")
//                        .resizable()
//                        .frame(width: 60, height: 60)
//                        .clipShape(Circle())
//                    Spacer()
//                    Group {
//                        Image(systemName: "plus.circle.fill")
//                            .resizable()
//                        Image(systemName: "bell.badge.fill")
//                            .resizable()
//                    }
//                    .frame(width: 25, height: 25)
//                }
//                HStack {
//                    HStack {
//                        Text("Search here")
//                            .font(.system(size: 14))
//                            .foregroundColor(Color(red: 0.29, green: 0.335, blue: 0.389))
//                        Spacer()
//                        Image(systemName: "magnifyingglass")
//                            .resizable()
//                            .frame(width: 13, height: 14)
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, maxHeight: 40)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(Color(hue: 0.594, saturation: 0.237, brightness: 0.987).opacity(0.4), lineWidth: 1.0)
//                    )
//                    .background(
//                        HStack {
//                            Rectangle()
//                                .fill(Color(red: 0.953, green: 0.973, blue: 0.999))
//                        }
//                        .cornerRadius(15)
//                    )
//                    HStack {
//                        Button(action: {
//                            showFilter = true
//                        }, label: {
//                            Image("filter")
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                            Text("Filter")
//                                .foregroundColor(.black)
//                                .font(.subheadline)
//                        })
//                        
//                    }
//                }
//                .padding(.bottom, -5)
//                SelectDateComponent()
//            }
//            Text("List Attendance")
//                .font(.subheadline)
//                .bold()
//        }
//        .padding(.horizontal)
//    }
//}
//
//#Preview {
//    AttendanceView()
//}

import SwiftUI

struct TimePickerExample: View {
    @State private var showPopup: Bool = false
    @State private var selectedTime = Date()

    var body: some View {
        VStack {
            PopupView(showPopup: $showPopup)
                .offset(x: 100, y: 100)
                .frame(height: 0)
                .onTapGesture {
                    showPopup.toggle()
                }
            Spacer()
        }
       
    }


}

struct TimePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerExample()
    }
}

