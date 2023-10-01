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
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(.brandPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .fontWeight(.medium)
        }
    }
}

#Preview {
    AddToOrderButtonView(text: "US$8.99 - Add To Order") {
        print("Foi")
    }
}
