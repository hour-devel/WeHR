//
//  LanguageSelectionView.swift
//  WeHR
//
//  Created by Lihour on 9/29/24.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Binding var showLanguageSheet: Bool
    @State private var selectedLanguage: String = UserDefaults.standard.string(forKey: "lang") ?? "Khmer"
    @Binding var showPermissionPopover: Bool
    
    func handleSelected(){
        //Popup Alert Permission Notification
        showPermissionPopover = true
        // Close the sheet on selection
        showLanguageSheet = false
        UserDefaults.standard.set(selectedLanguage, forKey: "lang")
    }
    
    var body: some View {
        GeometryReader{
            geo in
            VStack(alignment: .leading,spacing: 10) {
                Text("Language")
                    .customFontBold(size: 32)
                
                Text("Please select a display language")
                    .customFont(size: 18)
                    .foregroundColor(.gray)
                
                // Language selection options
                VStack(spacing: 15) {
                    LanguageOption(language: "Khmer", flag: "khmerLogo", isSelected: $selectedLanguage)
                    LanguageOption(language: "English", flag: "USlogo", isSelected: $selectedLanguage)
                    LanguageOption(language: "Korean", flag: "KoreaLogo", isSelected: $selectedLanguage)
                }.padding(.top,20)
                // Select button
                ButtonComponent(action: {
                    handleSelected()
                }, content: "Select")
 
            }
            .padding(.top,30)
            .padding(.horizontal,20)
            .presentationDetents([.height(440),.medium])
            .presentationBackground(.white)
            .presentationCornerRadius(36)
            .background(Color.white)
            .cornerRadius(20)
            .frame(minWidth: 300,maxWidth: geo.size.width,minHeight: 400,maxHeight: geo.size.height)
        }
    }
}

