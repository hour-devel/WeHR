//
//  OvertimeListCard.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct OvertimeListCard: View {
    var status : String
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Overtime").foregroundColor(Color(hex: "primary"))
                        .customFontMedium(size: 14)
                    HStack{
                        Image("calendar")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .opacity(0.7)
                        Group{
                            Text("01-08-2024")
                                .foregroundColor(Color(hex:"#374957"))
                            VStack{
                                
                            }.frame(width: 6,height: 6).background(Color(hex:"#D9D9D9")).clipShape(Circle())
                            Text("1 day off").foregroundColor(Color(hex:"#374957"))
                        }.customFont(size: 13)
                    }
                    HStack{
                        Image("calendar-lines-pen2")
                            .resizable()
                            .frame(width: 20,height: 18)
                            .opacity(0.7)
                        Text("- Fix Create Customer \n- Fix Create Customer ").font(Font.custom("Roboto-Regular", size: 12))
                            .foregroundColor(Color(hex: "#374957"))
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
                }.padding(.vertical
                )
              
            }.padding(.horizontal)
            
        }.frame(maxWidth: .infinity,minHeight: 120, maxHeight: 120)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#F3F4F6"), lineWidth:1)
            ).padding(.horizontal)
    }
}

#Preview {
    OvertimeListCard(status: "Approved")
}
