//
//  DetailView.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

struct ApptizerDetailView: View {
    let apptizer: Apptizer
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack {
            DetailImageView(imageURL: apptizer.imageURL)

            InformationView(apptizer: apptizer)
                .padding()

            AddToOrderButtonView(
                text: "\(apptizer.price.formatted(.currency(code: "USD"))) - Add To Order"
            ) {
                print("Adding to order")
            }
        }
        .frame(width: 320)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(radius: 24)
        .overlay(
            CloseButtonView {
                withAnimation {
                    isShowingDetailView = false
                }
            }
            .padding(8),
            alignment: .topTrailing
        )
    }
}

#Preview {
    ZStack {
        Image(.asianFlankSteak)
            .resizable()
        ApptizerDetailView(
            apptizer: MockData.sampleApptizer,
            isShowingDetailView: .constant(true)
        )
    }
}
