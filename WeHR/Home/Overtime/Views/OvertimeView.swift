//
//  OvertimeView.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct OvertimeView: View {
    let jjj = [
        OvertimeModel(status: "Request"),
        OvertimeModel(status: "Rejected"),
        OvertimeModel(status: "Approved"),
        OvertimeModel(status: "Request"),
        OvertimeModel(status: "Approved"),
        
    ]
    @State private var showFilter = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 13) {
                    VStack(spacing: 20) {
                        HStack {
                            Image("minji")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            Spacer()
                            Group {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                Image(systemName: "bell.badge.fill")
                                    .resizable()
                            }
                            .frame(width: 25, height: 25)
                        }
                        HStack {
                            HStack {
                                Text("Search here")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 0.29, green: 0.335, blue: 0.389))
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 13, height: 14)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(hue: 0.594, saturation: 0.237, brightness: 0.987).opacity(0.4), lineWidth: 1.0)
                            )
                            .background(
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 0.953, green: 0.973, blue: 0.999))
                                }
                                .cornerRadius(15)
                            )
                            HStack {
                                Button(action: {
                                    showFilter = true
                                }, label: {
                                    Image("filter")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("Filter")
                                        .foregroundColor(.black)
                                        .font(.subheadline)
                                })
                                
                            }
                        }
                        .padding(.bottom, -5)
                        SelectDateComponent()
                    }
                    
                }
                .padding(.horizontal)
                HStack{
                    Image("calendar-clock")
                    Text("My Overtime")
                        .customFont(size: 16).bold()
                    
                }.padding(.horizontal)
               

                ScrollView{
                    ForEach(jjj) { leave in
                        NavigationLink(destination: OvertimeDetailView().navigationBarHidden(true)) {
                            OvertimeListCard(status: leave.status)
                                
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .scrollIndicators(.hidden)

                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    OvertimeView()
}
