import SwiftUI

struct LeaveForm: View {
   
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    enum LeaveType {
        case annual, sick, special, none
    }
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startTime = "Morning"
    @State private var endTime = "Afternoon"
    @State private var reason: String = ""
     @State var isLeaveDetail: Bool
    @State var isEditLeave: Bool
    @State private var showActionSheet = false
    @State private var selectedFilter: LeaveType = .none
    @State private var showPopup = false
    var duration: String {
        let calendar = Calendar.current

        if endDate < startDate {
            return "Invalid date range"
        }
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        var daysOff = Double(components.day ?? 0) + 1.0 // Adding 1 to include the start day

       
        if startTime == "Afternoon" {
            daysOff -= 0.5
        }
        if endTime == "Morning" {
            daysOff -= 0.5
        }

        return String(format: "%.1f days off", daysOff)
    }

    var body: some View {
        NavigationView {
       
            
            VStack(alignment: .leading) {
         
                if isLeaveDetail {
                        PopupView(showPopup: $showPopup)
                       
                            .frame(height: 0)
                            .offset(x: 340, y: -30)
   

                }
                Text("Leave Type")
                    .customFont(size: 16)
                    .bold()
                
                HStack (spacing: 10){
                    VStack {
                        Text("Annual leave")
                            .customFont(size: 16)
                        
                        
                    }
                    .frame(maxWidth: .infinity,maxHeight: 60)
                    .background(Color(hex: "#D9D9D9").opacity(0.5))
                    .cornerRadius(10)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedFilter == .annual ? Color(hex: "#3F61E9") : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedFilter = .annual
                    }
                    
                    VStack {
                        Text("Sick leave")
                            .customFont(size: 16)
                        
                    }
                    .frame(maxWidth: .infinity,maxHeight: 60)
                    .background(Color(hex: "#D9D9D9").opacity(0.5))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedFilter == .sick ? Color(hex: "#3F61E9") : Color.clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedFilter = .sick
                    }
                }
                VStack{
                    Text("Special leave")
                }
                .frame(maxWidth: .infinity,maxHeight: 60)
                .background(Color(hex: "#D9D9D9").opacity(0.5))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedFilter == .special ? Color(hex: "#3F61E9") : Color.clear, lineWidth: 2)
                )
                .onTapGesture {
                    selectedFilter = .special
                }
                
                VStack (alignment: .leading, spacing: 16){
                    HStack{
                        Group{
                            Text("Start date")
                            Text("*").foregroundColor(Color(hex: "#EC221F"))
                        }.customFont(size: 16)
                        
                    }
                    HStack{
                        HStack(spacing: 22){
                            Image("calendar").padding(.leading)
                            VStack{
                                Text(startDate.formatted(.dateTime.day().month().year()))
                                    .customFont(size: 16)
                            }
                            .overlay(
                                DatePicker(selection: $startDate, displayedComponents: .date){}
                                    .labelsHidden()
                                    .colorMultiply(.clear)
                                    .disabled(isLeaveDetail)
                                    
                            )
                        }
                        .frame(maxWidth: .infinity,minHeight: 46,maxHeight: 46, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E7EB"),lineWidth: 1)
                        )
                        HStack {
                            Image("clock") // Optional icon for time picker
                            HStack(spacing: 22) {
                                Text(startTime) .customFont(size: 16)
                                Image("angle-right")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .rotationEffect(.degrees(90))
                            }
                            .frame(width: 140, height: 46)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "#E5E7EB"), lineWidth: 1) // Custom border to match date picker
                            )
                        }
                        .overlay(
                            Picker("", selection: $startTime) {
                                Text("Morning").tag("Morning")
                                Text("Afternoon").tag("Afternoon")
                            }
                                .pickerStyle(MenuPickerStyle()) // Styled as a menu picker
                                .labelsHidden() // Hide the labels to match appearance
                                .colorMultiply(.clear)
                                .clipped()
                                .disabled(isLeaveDetail ? true : false)
                        )
                        
                    }
                    HStack{
                        Group{
                            Text("End date")
                            Text("*").foregroundColor(Color(hex: "#EC221F"))
                        }.customFont(size: 16)
                        
                    }
                    HStack{
                        HStack(spacing: 22){
                            Image("calendar").padding(.leading)
                            VStack{
                                Text(endDate.formatted(.dateTime.day().month().year()))
                                    .customFont(size: 16)
                            }
                            .overlay(
                                DatePicker(selection: $endDate, displayedComponents: .date){}
                                    .labelsHidden()
                                    .colorMultiply(.clear)
                                    .disabled(isLeaveDetail)
                            )
                        }
                        .frame(maxWidth: .infinity,minHeight: 46,maxHeight: 46, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#E5E7EB"),lineWidth: 1)
                        )
                        HStack {
                            Image("clock")
                            HStack(spacing: 22) {
                                Text(endTime) .customFont(size: 16)
                                Image("angle-right")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .rotationEffect(.degrees(90))
                            }
                            .frame(width: 140, height: 46)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "#E5E7EB"), lineWidth: 1) // Custom border to match date picker
                            )
                        }
                        .overlay(
                            Picker("", selection: $startTime) {
                                Text("Morning").tag("Morning")
                                Text("Afternoon").tag("Afternoon")
                                    .disabled(isLeaveDetail)
                            }
                                .pickerStyle(MenuPickerStyle())
                                .labelsHidden()                                .colorMultiply(.clear)
                                .clipped()
                                
                        )
                        
                    }
                    
                    
                    // Duration Display
                    
                    Text("Duration")
                        .customFont(size: 16)
                    HStack{
                        VStack{
                            HStack {
                                Image(systemName: "clock").padding(.horizontal)
                                Text(duration)
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
                            
                        }.frame(width: 150, height: 46)
                    }
                    HStack{
                        Group{
                            Text("Reason")
                            Text("*").foregroundColor(Color(hex: "#EC221F"))
                        }.customFont(size: 16)
                        
                    }
                    //                TextEditor(text: $reason)
                    //                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 110)
                    //                    .padding()
                    //                    .overlay(
                    //                        RoundedRectangle(cornerRadius: 10)
                    //                            .stroke(Color(hex: "#E5E7EB"))
                    //
                    //                    )
                    TextEditorWithPlaceholder(text: $reason, placeholder: "Reason for leave").frame(maxWidth: .infinity,minHeight: 100,maxHeight: 110)
                    //
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "#E5E7EB"))
                            
                        )
                }
                Button{
                    
                }label: {
                    LongButton(buttonTittle:isEditLeave ? "Update Leave" : "Apply Leave")
                }
                .disabled(isLeaveDetail)
                .opacity(isLeaveDetail ? 0 : 1 )
                .padding(.top)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .navigationBarTitle( isLeaveDetail ? "Leave Detail" : isEditLeave ? "Edit Leave" : "Request Leave" , displayMode: .inline)                .navigationBarBackButtonHidden(true)
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
    LeaveForm(isLeaveDetail: true, isEditLeave: false)
}


