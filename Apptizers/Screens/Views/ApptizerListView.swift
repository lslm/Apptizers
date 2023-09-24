//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import SwiftUI

struct ApptizerListView: View {
    @StateObject private var apptizerListViewModel = ApptizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(apptizerListViewModel.apptizers) { apptizer in
                ApptizerListCell(apptizer: apptizer)
            }
            .listStyle(.plain)
            .navigationTitle("🍟 Apptizers")
        }
        .onAppear {
            apptizerListViewModel.getApptizers()
        }
    }
}

#Preview {
    ApptizerListView()
}
