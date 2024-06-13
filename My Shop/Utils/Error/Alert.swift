//
//  Alert.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dissmissButton: Alert.Button
}

struct AlertContext {
    //MARK - Network Error
    static let invalidData = AlertItem(title: Text("Invalid data"), message: Text("Invalid data Message"), dissmissButton: .default(Text("Got it")))
    static let invalidResponse = AlertItem(title: Text("Invalid response"), message: Text("Invalid response Message"), dissmissButton: .default(Text("Got it")))
    static let invalidUrl = AlertItem(title: Text("Invalid url"), message: Text("Invalid url message"), dissmissButton: .default(Text("Got it")))
    static let unableToComplete = AlertItem(title: Text("Unable to complete"), message: Text("Unable to complete Message"), dissmissButton: .default(Text("Got it")))
    
    //MARK - Account Error
    static let invalidForm = AlertItem(title: Text("Invalid form"), message: Text("Invalid form Message"), dissmissButton: .default(Text("Got it")))
    static let invalidEmail = AlertItem(title: Text("Invalid email"), message: Text("Invalid email Message"), dissmissButton: .default(Text("Got it")))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your profile information update successfully"), dissmissButton: .default(Text("Got it")))
    static let invalidUserData = AlertItem(title: Text("Profile Saved Unsuccessfull"), message: Text("Your profile information update failed"), dissmissButton: .default(Text("Got it")))
}
