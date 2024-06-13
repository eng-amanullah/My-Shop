//
//  User.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate = Date()
}
