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
                        .onTapGesture {
                            viewModel.showDetailView(for: apptizer)
                        }
                }
                .refreshable {
                    viewModel.getApptizers()
                }
                .listStyle(.grouped)
                .navigationTitle("🍟 Apptizers")
                .disabled(viewModel.isShowingDetailView)
            }
            .onAppear {
                viewModel.getApptizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 24 : 0)

            if viewModel.isLoading {
                ProgressView()
            }

            if viewModel.isShowingDetailView {
                ApptizerDetailView(
                    apptizer: viewModel.selectedApptizer!,
                    isShowingDetailView: $viewModel.isShowingDetailView
                )
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
