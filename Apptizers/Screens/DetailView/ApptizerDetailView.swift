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
            ApptizerRemoteImage(urlString: apptizer.imageURL)
                .scaledToFill()
                .frame(width: 320, height: 200)
                .clipped()

            InformationView(apptizer: apptizer)
                .padding()

            Button {

            } label: {
                Text("\(apptizer.price.formatted(.currency(code: "USD"))) - Add To Order")
                    .frame(height: 42)
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .background(.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .fontWeight(.medium)
                    .padding(.bottom, 16)
            }
        }
        .frame(width: 320)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(radius: 24)
        .overlay(
            CloseButtonView {
                isShowingDetailView = false
            }
            .padding(8),
            alignment: .topTrailing
        )
    }
}

#Preview {
    ApptizerDetailView(apptizer: MockData.sampleApptizer, isShowingDetailView: .constant(true))
}
