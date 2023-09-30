//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import SwiftUI

struct ApptizerListView: View {
    @StateObject private var viewModel = ApptizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.apptizers) { apptizer in
                    ApptizerListCell(apptizer: apptizer)
                }
                .refreshable {
                    viewModel.getApptizers()
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Apptizers")
            }
            .onAppear {
                viewModel.getApptizers()
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
    }
}

#Preview {
    ApptizerListView()
}
