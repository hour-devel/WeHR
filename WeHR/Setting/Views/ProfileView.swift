//
//  ProfileView.swift
//  WeHR
//
//  Created by Phal Madina on 6/10/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var username: String = "Louis Vuitton"
    @State private var email: String = "louisvuitton@gmail.com"
    @State private var department: String = "Mobile R&D"
    @State private var team: String = "Android"
    @State private var position: String = "Software Engineer I"
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {
        GeometryReader{ geo in
            NavigationView{
                VStack {
                    // Profile header with background color and image
                    ZStack {
                        Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 0.75)
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: 250)
                        PhotosPicker(selection: $selectedImage, matching: .images){
                            VStack{
                                if let selectedImageData,
                                   let uiImage = UIImage(data: selectedImageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                }
                                else{
                                    Image("profile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .overlay(RoundedRectangle(cornerRadius: 50).fill(Color(red: 12 / 255, green: 12 / 255, blue: 13 / 255, opacity: 0.3))
                                        )
                                        .overlay(Image("camera")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                        )
                                }
                            }
                            .onChange(of: selectedImage) { newItem in
                                Task {
                                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                        selectedImageData = data
                                    }
                                }
                            }
                        }
                    }

                    // User information section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("User Information")
                            .font(.headline)
                            .padding(.top, 20)

                        // Username
                        InfoSectionComponent(title: "Username", data: "Louis Vuitton")
                        
                        // Email
                        InfoSectionComponent(title: "Email", data: "louisvuitton@gmail.com")

                        // Department
                        InfoSectionComponent(title: "Department", data: "Mobile R&D")

                        // Team
                        InfoSectionComponent(title: "Team", data: "Android")

                        // Position
                        InfoSectionComponent(title: "Position", data: "Software Engineer I")
                        .padding(.bottom, 20)
                        // Update button
                       AccountButton(title: "Update")
                    }
                    .padding(.horizontal, 20)
                    .frame(minWidth: 300, maxWidth: geo.size.width, maxHeight: 600)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.white)
                    )
                    .padding(.top, -30)
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Profile")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: HStack {
                        NavigationLink(destination: AccountSettingView()){
                            Image("arrowBackWhite")
                                .resizable()
                                .frame(width: 12, height: 20)
                                .foregroundColor(.white)
                        }
                    }
                )
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    ProfileView()
}
