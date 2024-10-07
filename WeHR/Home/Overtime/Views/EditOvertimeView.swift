//
//  EditOvertimeView.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct EditOvertimeView: View {
    var body: some View {
        VStack{
            OvertimeForm(isOvertimeDetail: false, isEditOvertime: true)
        }
    }
}

#Preview {
    EditOvertimeView()
}
