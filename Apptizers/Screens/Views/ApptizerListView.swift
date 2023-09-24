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
                ApptizerListCell(apptizer: apptizer)
            }
            .listStyle(.plain)
            .navigationTitle("🍟 Apptizers")
        }
    }
}

#Preview {
    ApptizerListView()
}
