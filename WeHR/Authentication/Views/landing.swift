//
//  landing.swift
//  WeHR
//
//  Created by Lihour on 9/29/24.
//
import SwiftUI

struct Landing: View {
    @State var showLanguageSheet = false
    @State var showNotificationAlert = false
    @State var showPermissionPopover = false
    @State var isGetStart = false
    @State var progress = 0.0
    
    var body: some View {
        NavigationStack{
            GeometryReader{
                geo in
                Image(.splashScreen)
                    .resizable()
                    .scaledToFill()
                    .blur(radius: showLanguageSheet || showPermissionPopover ? 2 : 0)
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 300,maxWidth: geo.size.width,minHeight: 300,maxHeight: geo.size.height)
                    .padding(.leading,-70)
                    .overlay{
                        ButtonComponent(action: {
                            showLanguageSheet = true
                        }, content: "Get Start")
                        .offset(x:35,y:360)
                        .disabled(showPermissionPopover ? true : false)
                    }
                    .overlay{
                        Rectangle()
                            .foregroundColor(showLanguageSheet || showPermissionPopover ? Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255, opacity: 0.69) : .clear)
                            .edgesIgnoringSafeArea(.all)
                            .frame(minWidth: 300,maxWidth: geo.size.width,minHeight: 300,maxHeight: geo.size.height)
                            .padding(.trailing,-70)
                    }
                    .sheet(isPresented: $showLanguageSheet) {
                        LanguageSelectionView(showLanguageSheet: $showLanguageSheet,showPermissionPopover: $showPermissionPopover)
                    }
                // Permission Popover
                if showPermissionPopover {
                    PermissionNotificationPopover(showPermissionPopover: $showPermissionPopover,isGetStart:$isGetStart)
                        .transition(.scale)
                }
            }
            .navigationDestination(isPresented: $isGetStart) {
                LoginView()
            }
        }
    }
}

#Preview{
    Landing()
}
