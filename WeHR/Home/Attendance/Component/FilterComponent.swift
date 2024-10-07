//
//  FilterVoew.swift
//  WeHR
//
//  Created by Ly Nita on 6/10/24.
//

import SwiftUI

struct FilterComponent: View {
    @Binding var isPresented: Bool
    @State private var selectedDate = "AES Date"
    @State private var statusSelection: [String: Bool] = [
        "Miss Check-in": true,
        "Late Check-in": true,
        "Absent": true,
        "Miss Check out": true,
        "Early Check": true
    ]
    
    private var statusOrder: [String] {
        ["Miss Check-in", "Late Check-in", "Absent", "Miss Check out", "Early Check"]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Filter")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "multiply.circle")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 10)
            
            Text("Date")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(["AES Date", "DES Date"], id: \.self) { date in
                    Button(action: {
                        selectedDate = date
                    }) {
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(selectedDate == date ? Color.blue : Color.gray, lineWidth: 2)
                                    .frame(width: 20, height: 20)
                                
                                if selectedDate == date {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 10, height: 10)
                                }
                            }
                            Text(date)
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                        }
                    }
                }
            }
            .padding(.bottom, 10)
            
            Divider()
                .frame(height: 1)
            
            Text("Status")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(statusOrder, id: \.self) { key in
                    CustomCheckbox(isOn: Binding(
                        get: { self.statusSelection[key] ?? false },
                        set: { self.statusSelection[key] = $0 }
                    )) {
                        Text(key)
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                }
            }
            .padding(.bottom, 10)
            
            Button(action: {
            }) {
                Text("Apply")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// Custom Checkbox Component
struct CustomCheckbox<Label: View>: View {
    @Binding var isOn: Bool
    let label: () -> Label
    
    var body: some View {
        Button(action: {
            isOn.toggle()
        }) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isOn ? Color.blue : Color.gray, lineWidth: 2)
                        .frame(width: 24, height: 23)
                    if isOn {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.blue)
                            .frame(width: 24, height: 23)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .padding(.trailing, 8)
                label()
            }
        }
    }
}
