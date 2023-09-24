//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import SwiftUI

struct ApptizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.sampleApptizers) { apptizer in
                HStack {
                    Image("asian-flank-steak")
                        .resizable()
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
            .listStyle(.plain)
            .navigationTitle("🍟 Apptizers")
        }
    }
}

#Preview {
    ApptizerListView()
}
