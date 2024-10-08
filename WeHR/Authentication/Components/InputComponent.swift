//
//  InputComponent.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
//

import SwiftUI

struct InputComponent: View {
    @Binding var textInput:String
    @State var placeHolder : String
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    var body: some View {
        GeometryReader{
            geo in
            TextField("\(Image("Email"))\t \(placeHolder)", text: $textInput)
                .customFont(size: 20)
                .padding(.horizontal , 15)
                .frame(minWidth: 300,maxWidth: geo.size.width,maxHeight: 40)
                .padding(.vertical,10)
                .background(Color(red: 249 / 255, green: 250 / 255, blue: 251 / 255, opacity: 1.0))
                .cornerRadius(10)
                .multilineTextAlignment(.leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 229 / 255, green: 231 / 255, blue: 235 / 255, opacity: 1.0), lineWidth: 1)
                )
        }
    }
}


