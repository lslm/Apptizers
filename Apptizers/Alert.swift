//
//  Alert.swift
//  Apptizers
//
//  Created by Lucas Santos on 30/09/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to reach server"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to parse response"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidData = AlertItem(
        title: Text("Invalid Data"),
        message: Text("Unable to parse data"),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Unable to complete"),
        message: Text("Unable to make request"),
        dismissButton: .default(Text("OK"))
    )
}
