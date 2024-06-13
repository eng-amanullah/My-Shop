//
//  LanguageSetting.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

@Observable
class LanguageSetting {
    // initialise this from UserDefaults if you like
    var en = Locale(identifier: "en")
    var bn = Locale(identifier: "bn-BD")
}
