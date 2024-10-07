//
//  TextEditorWithPlaceholder.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//
import SwiftUI
struct TextEditorWithPlaceholder: View {
        @Binding var text: String
        var placeholder: String
        var body: some View {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                   VStack {
                       Text(placeholder)
                           .customFont(size: 16)
                            .padding(.top, 10)
                            .padding(.leading, 6)
                            .opacity(0.9)
                        Spacer()
                    }
                }
                
                VStack {
                    TextEditor(text: $text)
                        .customFont(size: 16)
                        .frame(minHeight: 100, maxHeight: .infinity)
                        .opacity(text.isEmpty ? 0.85 : 1)
                    Spacer()
                }
            }
        }
    }
