//
//  CoreDataModel.swift
//  My Shop
//
//  Created by Amanullah Sarker on 13/6/24.
//

import Foundation

struct CoreDataModel: Decodable, Identifiable {
    let id: Int?
    let name: String
    let price: Double
}
