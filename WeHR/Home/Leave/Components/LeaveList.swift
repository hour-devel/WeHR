//
//  LeaveList.swift
//  WeHR
//
//  Created by MacBook Pro on 1/10/24.
//

import SwiftUI

struct LeaveListCard: View {
    var leaveType : String
    var status : String
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(leaveType).foregroundColor(leaveType=="Annual Leave" ? Color(hex: "#3F61E9"): leaveType=="Sick Leave" ? Color(hex: "#EEAF4C") : leaveType == "Special Leave" ? Color(hex: "#DD5596") : .black).customFontMedium(size: 14)
                    HStack{
                        Image("calendar")
                            .resizable()
                            .frame(width: 20,height: 20)
                        Group{
                            Text("01-08-2024")
                                .foregroundColor(Color(hex:"#374957"))
                            VStack{
                                
                            }.frame(width: 6,height: 6).background(Color(hex:"#D9D9D9")).clipShape(Circle())
                            Text("1 day off").foregroundColor(Color(hex:"#374957"))
                        }.customFontMedium(size: 14)
                    }
                    HStack{
                        Image("calendar-lines-pen2")
                            .resizable()
                            .frame(width: 24,height: 24)
                        Text("Personal Issuse").font(Font.custom("Roboto-Regular", size: 13))
                    }
                }
                Spacer()
                VStack(alignment: .trailing){
                    VStack{
                        Text(status)
                            .customFont(size: 11)
    //                        .padding(.horizontal,12)
    //                        .padding(.vertical,5)
                            .foregroundColor(Color(hex: status == "Rejected" ? "#EC221F" : status == "Approved" ? "#0D9488" : "#2489FF"))
                           
                    }.frame(width: 67, height: 21.47)
                        .background(Color(hex: status == "Rejected" ? "#FEE9E7": status == "Approved" ? "#CCFBF1" : "#DFF7FC")).cornerRadius(7)
                    Spacer()
                    Image("angle-right")
                        .resizable()
                        .frame(width: 16,height: 16)
                }.padding(.vertical)
              
            }.padding(.horizontal)
            
        }.frame(maxWidth: .infinity,minHeight: 120, maxHeight: 120)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#F3F4F6"), lineWidth:1)
            ).padding(.horizontal)
           
    }
}

#Preview {
    LeaveListCard(leaveType: "Special Leave", status: "Request")
}


