//
//  OrderViewModel.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import Foundation

final class CartViewModel: ObservableObject {
    
    @Published var cartItems: [Appetizer] = []
    
    func addItemInCart(appetizer: Appetizer) {
        cartItems.append(appetizer)
    }
    
    func deleteItemFromCart(indexSet: IndexSet) {
        cartItems.remove(atOffsets: indexSet)
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) {
            $0 + $1.price
        }
    }
}
