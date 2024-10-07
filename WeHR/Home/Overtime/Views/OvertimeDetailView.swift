//
//  OvertimeDetailView.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct OvertimeDetailView: View {
    var body: some View {
        OvertimeForm(isOvertimeDetail: true, isEditOvertime: false)
    }
}

#Preview {
    OvertimeDetailView()
}
