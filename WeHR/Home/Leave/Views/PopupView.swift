import SwiftUI

struct PopupView: View {
    @Binding var showPopup: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                Spacer()
                Image("menu-dots-vertical")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .onTapGesture {
                        showPopup.toggle()
                        if showPopup{
                            print("showPopup is true")
                        }

                    }
                Spacer()
            }
            
            if showPopup {
                VStack(alignment: .leading) {
                    Button(action: {
                        print("Edit tapped")
                        showPopup = false 
                    }) {
                        HStack {
                            Text("Edit")
                                .customFont(size: 14)
                            Spacer()
                            Image("pencil")
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top)

                    Spacer()

                    Button(action: {
                        print("Delete tapped")
                    }) {
                        HStack {
                            Text("Delete")
                                .customFont(size: 14)
                            Spacer()
                            Image("trash")
                        }
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 10)
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 109, height: 88, alignment: .leading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color(hex: "#E6E6E6"), radius: 10, x: 0, y: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#E6E6E6"), lineWidth: 1)
                )
                .transition(.scale)
                .offset(x: -120, y: 30) // Shift popup left without affecting dot
            }
        } .zIndex(10)
    }
}

#Preview {
    PopupView(showPopup: .constant(true))
}
