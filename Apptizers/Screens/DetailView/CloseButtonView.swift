//
//  SwiftUIView.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

struct CloseButtonView: View {
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .bold()
                .padding(8)
                .foregroundStyle(Color.secondary)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    CloseButtonView {
        print("Close")
    }
}
