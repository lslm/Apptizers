//
//  ApptizerListCell.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import SwiftUI

struct ApptizerListCell: View {
    let apptizer: Apptizer
    
    var body: some View {
        HStack {
            ApptizerRemoteImage(urlString: apptizer.imageURL)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.red)
                .scaledToFit()
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(apptizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$ \(apptizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding([.leading])
        }
    }
}

#Preview {
    ApptizerListCell(apptizer: MockData.sampleApptizer)
}
