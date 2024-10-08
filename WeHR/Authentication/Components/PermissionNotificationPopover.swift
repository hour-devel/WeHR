//
//  PermissionNotificationPopover.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
//

import SwiftUI

struct PermissionNotificationPopover: View {
    @Binding var showPermissionPopover: Bool
    @Binding var isGetStart:Bool
    
    func askNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                isGetStart = true
                print("Notification permission granted.")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Bell icon
            Image(systemName: "bell.fill")
                .font(.system(size: 40))
                .foregroundColor(.blue)
            
            // Permission text
            Text("Allow **Permissions Sample App** \n to send you notifications?")
                .customFont(size: 16)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            // Action buttons
            VStack(spacing: 10) {
                Button(action: {
                    showPermissionPopover = false
                    
                    // handle Notification
                    askNotificationPermission()
                }) {
                    Text("Allow")
                        .frame(width: 250, height: 50)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.black)
                }
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 10, topTrailingRadius: 10))
                Button(action: {
                    showPermissionPopover = false
                }) {
                    Text("Don't allow")
                        .frame(width: 250, height: 50)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.black)
                }
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 10, bottomTrailingRadius: 10))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


