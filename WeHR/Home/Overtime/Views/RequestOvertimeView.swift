//
//  RequestOvertimeView.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct RequestOvertimeView: View {
    var body: some View {
        NavigationView{
            OvertimeForm(isOvertimeDetail: false, isEditOvertime: false)
            Spacer()
        }
        
    }
}

#Preview {
    RequestOvertimeView()
}
