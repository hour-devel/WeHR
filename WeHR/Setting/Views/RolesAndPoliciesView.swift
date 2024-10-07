//
//  RolesAndPoliciesView.swift
//  WeHR
//
//  Created by Phal Madina on 7/10/24.
//

import SwiftUI

struct RolesAndPoliciesView: View {
    var body: some View {
        GeometryReader{ geo in
            NavigationView{
                VStack{
                    ZStack{
                        VStack(alignment: .leading, spacing: 16){
                            HStack{
                                Group{
                                    
                                }
                                Text("•")
                                    .offset(y: -10)
                                    .foregroundColor(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                                    .font(.system(size: 15, weight: .semibold))
                                Text("Annual Leave (AL):")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                                + Text(" Standard leave provided to employees for personal use.")
                                    .font(.system(size: 15))
                                            
                            }
                            
                            // Special Leave
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Group{
                                        Text("•")
                                        Text("Special Leave:")
                                    }
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                                }
                                VStack(alignment: .leading){
                                    Group{
                                        Text("• Deducted from Annual Leave first.")
                                        Text("• Includes leave for:")
                                    }
                                    .font(.system(size: 15))
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Group{
                                                Text("• Marriage")
                                                Text("• Wife giving birth")
                                                Text("• Immediate family member passing away")
                                            }
                                            .font(.system(size: 15))
                                        }
                                        .padding(.leading, 20)
                                    }
                                }
                                .padding(.leading, 30)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .frame(width: 380, height: 400)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 229 / 255, green: 231 / 255, blue: 233 / 255, opacity: 1.0), lineWidth: 2)
                    )
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Roles and Policies")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: HStack {
                        NavigationLink(destination: SummaryView()){
                                    Image("arrowbackward")
                                        .resizable()
                                        .frame(width: 12, height: 20)
                                }
                    }
                )
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    RolesAndPoliciesView()
}
