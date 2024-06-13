//
//  ShopButton.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

struct ShopButton: View {
    
    let buttonTitle: LocalizedStringKey
    
    var body: some View {
        Text(buttonTitle)
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.brandPrimaryColorV2)
            //.cornerRadius(10)
            .clipShape(.buttonBorder)
            .foregroundStyle(.white)
    }
}

#Preview {
    ShopButton(buttonTitle: "Add to cart")
}
