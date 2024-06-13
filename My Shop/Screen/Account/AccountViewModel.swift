//
//  AccountViewModel.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @AppStorage("isDarkMode") var isDarkMood: Bool = false
    @AppStorage("isEnglish") var isEnglish: Bool = false
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var validate: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true 
    }
    
    func saveChanges() {
        guard validate else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func getUserData() {
        guard let userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
