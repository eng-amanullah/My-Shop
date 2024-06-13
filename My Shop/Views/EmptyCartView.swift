//
//  EmptyCartView.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

struct EmptyCartView: View {
    
    let imageName: String
    let title: Text
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.brandColorV2)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            
            title
                .font(.title2)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
        }
        .padding()
        .offset(y: -50)
    }
}

#Preview {
    EmptyCartView(imageName: "cart", title: Text("Your cart is empty. Add item for checkout."))
}
