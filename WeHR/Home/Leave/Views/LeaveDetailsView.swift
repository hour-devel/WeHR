//
//  LeaveDetailsView.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct LeaveDetailsView: View {
    var isLeaveDetail: Bool = true
    var body: some View {
        LeaveForm(isLeaveDetail: isLeaveDetail, isEditLeave: false)
    }
}

#Preview {
    LeaveDetailsView()
}
