//
//  ApptizerListViewModel.swift
//  Apptizers
//
//  Created by Lucas Santos on 24/09/23.
//

import SwiftUI

final class ApptizerListViewModel: ObservableObject {
    @Published var apptizers: [Apptizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedApptizer: Apptizer?

    func getApptizers() {
        isLoading = true

        NetworkManager.shared.getApptizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let apptizers):
                    withAnimation {
                        self.apptizers = apptizers
                    }
                case .failure(let error):
                    self.alertItem = self.getAlertItem(for: error)
                }
            }
        }
    }
    
    func getAlertItem(for error: APError) -> AlertItem {
        switch error {
        case .invalidData:
            return AlertContext.invalidData
            
        case .invalidURL:
            return AlertContext.invalidURL
            
        case .invalidResponse:
            return AlertContext.invalidResponse
            
        case .unableToComplete:
            return AlertContext.unableToComplete
        }
    }

    func showDetailView(for apptizer: Apptizer) {
        withAnimation {
            isShowingDetailView = true
            selectedApptizer = apptizer
        }
    }
}
