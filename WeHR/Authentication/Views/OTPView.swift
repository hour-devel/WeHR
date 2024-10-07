//  OTPView.swift
//  WeHR
//
//  Created by Lihour on 9/30/24.
import SwiftUI
import Combine

// Main View for OTP fields
struct OTPView: View {
    enum FocusPin {
        case pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix
    }
    @FocusState private var pinFocusState: FocusPin?
    @State private var pinOne = ""
    @State private var pinTwo = ""
    @State private var pinThree = ""
    @State private var pinFour = ""
    @State private var pinFive = ""
    @State private var pinSix = ""
    
    
    // Verify OTP Action
    private func verifyOtp() {
        // Logic to verify OTP
        let otp = pinOne + pinTwo + pinThree + pinFour + pinFive + pinSix
        print("OTP Entered: \(otp)")
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Text("Enter confirmation code")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("A 6-digit code we sent to your email")
                    .font(.caption)
                    .fontWeight(.thin)
                    .padding(.top)
                // OTP Input Fields
                HStack(spacing: 15) {
                    otpTextField(text: $pinOne, focus: .pinOne, nextFocus: .pinTwo)
                    otpTextField(text: $pinTwo, focus: .pinTwo, nextFocus: .pinThree, prevFocus: .pinOne)
                    otpTextField(text: $pinThree, focus: .pinThree, nextFocus: .pinFour, prevFocus: .pinTwo)
                    otpTextField(text: $pinFour, focus: .pinFour, nextFocus: .pinFive, prevFocus: .pinThree)
                    otpTextField(text: $pinFive, focus: .pinFive, nextFocus: .pinSix, prevFocus: .pinFour)
                    otpTextField(text: $pinSix, focus: .pinSix, prevFocus: .pinFive)
                }
                .padding(.vertical)
                Spacer()
                Button(action:{}){
                    Text("Resend code")
                        .font(.system(size: 18,weight: .semibold))
                        .foregroundStyle(Color(red: 63 / 255, green: 97 / 255, blue: 233 / 255, opacity: 1.0))
                }
                // Verify Button
                ButtonComponent(action: verifyOtp, content: "Continue")
                    .padding()
            }
            .onAppear {
                pinFocusState = .pinOne // Focus on the first field on appear
            }
        }
    }
    // Reusable OTP text field with focus management
    private func otpTextField(text: Binding<String>, focus: FocusPin, nextFocus: FocusPin? = nil, prevFocus: FocusPin? = nil) -> some View {
        TextField("", text: text)
            .modifier(OTPModifier(pin: text, isFocused: pinFocusState == focus))
            .onChange(of: text.wrappedValue) { newValue in
                if newValue.count == 1 {
                    if let next = nextFocus {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            pinFocusState = next
                        }
                    }
                } else if newValue.isEmpty, let prev = prevFocus {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        pinFocusState = prev
                    }
                }
            }
            .focused($pinFocusState, equals: focus)
            .onReceive(Just(text.wrappedValue)) { _ in
                if text.wrappedValue.count > 1 {
                    text.wrappedValue = String(text.wrappedValue.prefix(1))
                }
            }
    }
}

struct OtpFormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}

