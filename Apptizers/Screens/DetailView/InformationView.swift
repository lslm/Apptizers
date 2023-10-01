//
//  InformationView.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

struct InformationView: View {
    let apptizer: Apptizer

    var body: some View {
        VStack {
            Text(apptizer.name)
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.medium)

            Text(apptizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundStyle(.secondary)
                .padding()

            HStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Calories")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)

                    Text("\(apptizer.calories)")
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 8) {
                    Text("Carbs")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)

                    Text("\(apptizer.carbs) g")
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 8) {
                    Text("Protein")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)

                    Text("\(apptizer.protein) g")
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
    }
}

#Preview {
    InformationView(apptizer: MockData.sampleApptizer)
}
