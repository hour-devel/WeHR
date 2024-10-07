//
//  AttendanceViewModel.swift
//  WeHR
//
//  Created by Ly Nita on 6/10/24.
//

import SwiftUI

class AttendanceViewModel: ObservableObject {
    @Published var attendances: [Attendance] = [
        Attendance(date: "09 Aug 2024", time: "06:06:43 PM", description: "Late Check-out", imageName: "AttendanceArrowRight"),
        Attendance(date: "12 Aug 2024", time: "07:59:43 AM", description: "Early Check-in", imageName: "AttendanceArrowLeft"),
        Attendance(date: "12 Aug 2024", time: "07:59:43 AM", description: "Early Check-in", imageName: "AttendanceArrowLeft"),
        Attendance(date: "12 Aug 2024", time: "07:59:43 AM", description: "Early Check-in", imageName: "AttendanceArrowLeft"),
        Attendance(date: "12 Aug 2024", time: "07:59:43 AM", description: "Early Check-in", imageName: "AttendanceArrowLeft")
    ]
}
