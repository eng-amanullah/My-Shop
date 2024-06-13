//
//  ShopToggle.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

struct ShopToggle: View {
    
    let title: String
    @Binding var isDarkMood: Bool
    
    var body: some View {
        Toggle(title, isOn: $isDarkMood)
            .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryColorV2))
    }
}

#Preview {
    ShopToggle(title: "Dark Mood", isDarkMood: .constant(true))
}
