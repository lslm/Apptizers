//
//  ApptizerListViewModel.swift
//  Apptizers
//
//  Created by Lucas Santos on 24/09/23.
//

import Foundation

final class ApptizerListViewModel: ObservableObject {
    @Published var apptizers: [Apptizer] = []
    
    func getApptizers() {
        NetworkManager.shared.getApptizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let apptizers):
                    self.apptizers = apptizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}