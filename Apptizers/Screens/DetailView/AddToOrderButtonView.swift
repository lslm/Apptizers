//
//  AddToOrderButtonView.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

struct AddToOrderButtonView: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(height: 42)
                .padding(.horizontal)
                .foregroundStyle(.white)
                .background(.brandPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .fontWeight(.medium)
                .padding(.bottom, 16)
        }
    }
}

#Preview {
    AddToOrderButtonView(text: "US$8.99 - Add To Order") {
        print("Foi")
    }
}
