//
//  NetworkManager.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let CompleteUrl = baseUrl + "appetizers"
    
    private init() {}
    
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: CompleteUrl) else {
            throw ShopError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
        } catch {
            throw ShopError.invalidData
        }
    }
}
