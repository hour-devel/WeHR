//
//  OvertimeForm.swift
//  WeHR
//
//  Created by MacBook Pro on 6/10/24.
//

import SwiftUI

struct OvertimeForm: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var date = Date()
    @State var startTime = Date()
    @State var endTime = Date()
    @State var reason : String = ""
    @State var isOvertimeDetail: Bool
    @State var isEditOvertime: Bool
    @State private var showPopup = false
    
    
   
    func calculateTimeDuration() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: startTime, to: endTime)
        
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        
        return "\(hours).\(minutes)"
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                if isOvertimeDetail {
                    ZStack{
                        PopupView(showPopup: $showPopup)
                            .offset(x:340,y: -30)
                            .frame(height: 0)
                            .background(.red)
                        
                    }
                }
                HStack {
                    Group{
                        Text("Select date")
                        Text("*").foregroundColor(Color(hex: "#EC221F"))
                    }.customFont(size: 16)
                }
                // Date Picker for the date
                HStack {
                    HStack(spacing: 22) {
                        Image("calendar").padding(.leading)
                        VStack {
                            Text(date.formatted(.dateTime.day().month().year()))
                                .customFont(size: 16)
                        }
                        .overlay(
                            DatePicker(selection: $date, displayedComponents: .date) {}
                                .labelsHidden()
                                .colorMultiply(.clear)
                        )
                    }
                    .frame(maxWidth: .infinity, minHeight: 46, maxHeight: 46, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
                    )
                }
                .padding(.trailing, isEditOvertime || isOvertimeDetail ? 0 : 150)
                Text("Select time")
                    .customFont(size: 16)
                HStack{
                    
                    // Start Time Picker
                    HStack {
                        HStack(spacing: 22) {
                            Image("clock").padding(.leading)
                            VStack {
                                Text(startTime.formatted(.dateTime.hour().minute()))
                                    .customFont(size: 16)
                            }
                            .overlay(
                                DatePicker(selection: $startTime, displayedComponents: .hourAndMinute) {}
                                    .labelsHidden()
                                    .colorMultiply(.clear)
                            )
                        }
                        .frame(maxWidth: .infinity, minHeight: 46, maxHeight: 46, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
                        )
                    }
                    Text("to")
                        .customFont(size: 18)

                    // End Time Picker
                    HStack {
                        HStack(spacing: 22) {
                            Image("clock").padding(.leading)
                            VStack {
                                Text(endTime.formatted(.dateTime.hour().minute()))
                                    .customFont(size: 16)
                            }
                            .overlay(
                                DatePicker(selection: $endTime, displayedComponents: .hourAndMinute) {}
                                    .labelsHidden()
                                    .colorMultiply(.clear)
                            )
                        }
                        .frame(maxWidth: .infinity, minHeight: 46, maxHeight: 46, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E7EB"), lineWidth: 1)
                        )
                    }
                  
                    
                }
                // Display the calculated duration
                Text("Duration")
                    .customFont(size: 16)
                HStack{
                    VStack{
                        HStack {
                            Image(systemName: "clock").padding(.horizontal)
                            Text(calculateTimeDuration())
                                .customFont(size: 16)
                        }
                    }
                    .frame(maxWidth: .infinity,minHeight: 46, maxHeight: 46,alignment: .leading)
                    .background(Color(hex: "#F3F8FF"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#E5E7EB"))
                    )
                    VStack{
                        Text("0.125 for 1h if you work 8h/day")
                            .customFont(size: 13)
                    }.frame(maxWidth: .infinity, minHeight: 46, maxHeight: 46)
                }
                HStack {
                    Group{
                        Text("Reason")
                        Text("*").foregroundColor(Color(hex: "#EC221F"))
                    }.customFont(size: 16)
                }
                TextEditorWithPlaceholder(text: $reason, placeholder: "Enter your reason here")
                    .frame(maxWidth: .infinity,minHeight: 100,maxHeight: 110)

                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#E5E7EB"))
                        
                    )
                if !isOvertimeDetail && !isEditOvertime{
                    ButtonComponent(action: {
                        print("Apply Overtime")
                    }, content: "Apply Overtime")
                    .padding(.vertical)
                }
                
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(isOvertimeDetail ? "Overtime Detail" : isEditOvertime ? "Edit Overtime" : "Request Overtime" , displayMode: .inline)                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image("angle-right")
                            .foregroundColor(.blue)
                            .rotationEffect(.degrees(180))
    
                    }
                })
            
        }
    }
}

#Preview {
    OvertimeForm(isOvertimeDetail: true, isEditOvertime: false)
}
