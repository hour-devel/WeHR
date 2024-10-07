//
//  WeHRView.swift
//  WeHR
//
//  Created by Lihour on 9/27/24.
//

import SwiftUI

struct WeHRView: View {
    var body: some View {
        TabView{
            Text("Summary").tabItem {
                Image("Summary")
                Text("Summary")
            }
            AttendanceView().tabItem {
                Image("Attendance")
                Text("Attendance")
            }
            Text("Leave").tabItem {
                Image("Leave")
                Text("leave")
            }
            Text("Overtime").tabItem {
                Image("OvertimeIcon")
                Text("Overtime")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WeHRView()
}
