import SwiftUI
struct LeaveRequestView : View {
    var body: some View {
        LeaveForm(isLeaveDetail: false, isEditLeave: false)
    }
}
#Preview {
    LeaveRequestView()
}
