//
//  AccountButton.swift
//  WeHR
//
//  Created by Phal Madina on 6/10/24.
//

import SwiftUI

struct AccountButton: View {
    @State var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .bold))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

//#Preview {
//    AccountButton()
//}
