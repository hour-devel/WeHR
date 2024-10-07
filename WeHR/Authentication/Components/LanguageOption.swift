//
//  LanguageOption.swift
//  WeHR
//
//  Created by Lihour on 9/29/24.
//

import SwiftUI

struct LanguageOption: View {
    let language: String
    let flag: String
    @Binding var isSelected: String
    
    var body: some View {
        GeometryReader{
            geo in
            Button(action:{isSelected = language}){
                HStack {
                    Image(flag)
                        .resizable()
                        .frame(width: 60,height: 60)
                        .scaledToFill()
                        .padding(.vertical,-10)
                        .padding(.trailing,20)
                    
                    Text(language)
                        .font(.system(size: 18,weight: isSelected == language ? .semibold : .medium))
                        .foregroundColor(.primary)
                    Spacer()
                    if isSelected == language {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                            .font(.system(size: 24,weight: .bold))
                    }
                }
                .frame(minWidth: 200,maxWidth: geo.size.width)
                .padding()
                .background(isSelected == language ? Color.blue.opacity(0.1) : .clear)
                .cornerRadius(15)
            }
        }
    }
}

