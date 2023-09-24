//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import SwiftUI

struct ApptizerListView: View {
    
    @State private var apptizers: [Apptizer] = []
    
    var body: some View {
        NavigationView {
            List(apptizers) { apptizer in
                ApptizerListCell(apptizer: apptizer)
            }
            .listStyle(.plain)
            .navigationTitle("🍟 Apptizers")
        }
        .onAppear {
            getApptizers()
        }
    }
    
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

#Preview {
    ApptizerListView()
}
