//
//  DetailImageView.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

struct DetailImageView: View {
    let imageURL: String

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .scaledToFill()
        .frame(width: 320, height: 240)
        .clipped()
    }
}

#Preview {
    DetailImageView(imageURL: MockData.sampleApptizer.imageURL)
}
