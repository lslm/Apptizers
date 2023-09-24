//
//  Apptizer.swift
//  Apptizers
//
//  Created by Lucas Santos on 23/09/23.
//

import Foundation

struct Apptizer: Decodable, Identifiable {
    let id: Int
    let description: String
    let calories: Int
    let imageURL: String
    let carbs: Int
    let protein: Int
    let name: String
    let price: Double
}

struct ApptizerResponse: Decodable {
    let request: [Apptizer]
}

struct MockData {
    static let sampleApptizer = Apptizer(
        id: 1,
        description: "This perfectly thin cut just melts in your mouth.",
        calories: 100,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
        carbs: 12,
        protein: 20,
        name: "Asian Flank Steak",
        price: 8.99
    )
    
    static let sampleApptizers = [sampleApptizer, sampleApptizer, sampleApptizer]
}
