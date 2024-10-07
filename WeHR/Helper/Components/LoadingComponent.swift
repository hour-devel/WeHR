//
//  LoadingComponent.swift
//  WeHR
//
//  Created by Lihour on 10/3/24.
//

import SwiftUI

struct LoadingComponent: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .scaleEffect(1.5)
    }
}

#Preview {
    LoadingComponent()
}
