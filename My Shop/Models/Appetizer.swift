//
//  Appetizer.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int?
    let name: String
    let description: String?
    let price: Double
    let imageURL: String?
    let calories: Int?
    let protein: Int?
    let carbs: Int?
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let appetizer = Appetizer(id: 1,
                                     name: "Burger the King",
                                     description: "The energy in food is measured in units called calories", price: 250.345, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 130, protein: 50, carbs: 78)
    
    static let appetizers = [appetizer, appetizer, appetizer]
}
