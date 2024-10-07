//
//  WeHRView.swift
//  WeHR
//
//  Created by Lihour on 9/27/24.
//

import SwiftUI

struct WeHRView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack{
                Text("Summary")
            }
            .tag(0)
            .tabItem{
                Label("Summary", image: selectedTab == 0 ? "active-summary" : "summary")
            }
            VStack{
                AttendanceView()
            }
            .tag(1)
            .tabItem{
                Label("Attendance", image: selectedTab == 1 ? "active-attendance" : "attendance")
            }
            VStack{
                LeaveView()
            }
            .tag(2)
            .tabItem{
                Label("Leave", image: selectedTab == 2 ? "active-leave" : "leave")
            }
            VStack{
                OvertimeView()
            }
            .tag(3)
            .tabItem{
                Label("Overtime", image: selectedTab == 3 ? "active-overtime" :"overtimeIcon")
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(Color(hex: "#3F61E9"))
    }
}

#Preview {
    WeHRView()
}
