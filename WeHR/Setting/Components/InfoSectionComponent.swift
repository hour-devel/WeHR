//
//  InfoSectionComponent.swift
//  WeHR
//
//  Created by Phal Madina on 7/10/24.
//

import SwiftUI

struct InfoSectionComponent: View {
    @State var title: String
    @State var data: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 15, weight: .regular))
            TextField(title, text: $data)
                .frame(width: 350, height: 50)
                .padding(.horizontal,20)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 229 / 255, green: 231 / 255, blue: 233 / 255, opacity: 1.0), lineWidth: 2)
                )
        }
    }
}

//#Preview {
//    InfoSectionComponent()
//}
