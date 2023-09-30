//
//  ApptizerListViewModel.swift
//  Apptizers
//
//  Created by Lucas Santos on 24/09/23.
//

import Foundation

final class ApptizerListViewModel: ObservableObject {
    @Published var apptizers: [Apptizer] = []
    @Published var alertItem: AlertItem?
    
    func getApptizers() {
        NetworkManager.shared.getApptizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let apptizers):
                    self.apptizers = apptizers
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
}
