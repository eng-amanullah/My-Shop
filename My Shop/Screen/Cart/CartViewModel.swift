//
//  OrderViewModel.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import Foundation
import CoreData
import SwiftUI

final class CartViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var cartItems: [CartEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "ShopContainer")
        container.loadPersistentStores { (description, error) in
            if let error {
                print("Error loading core data \(String(describing: error))")
            }
            
            self.fetchCartItem()
        }
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) {
            $0 + $1.price
        }
    }
    
    func addCartItem(name: String, price: Double, imageUrl: String) {
        let newItem = CartEntity(context: container.viewContext)
        newItem.name = name
        newItem.price = price
        newItem.imageurl = imageUrl
        
        saveData()
    }
    
    func deleteCartItem(indexSet: IndexSet) {
        guard let index = indexSet.first else {
            return
        }
        
        let entity = cartItems[index]
        container.viewContext.delete(entity)
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCartItem()
        } catch {
            print("Error for saving data \(error)")
        }
    }
    
    func fetchCartItem() {
        let request = NSFetchRequest<CartEntity>(entityName: "CartEntity")
        
        do {
            cartItems = try container.viewContext.fetch(request)
        } catch {
            print("Error \(error)")
        }
    }
    
    func clearCart() {
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = CartEntity.fetchRequest()
              let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
              _ = try? container.viewContext.execute(batchDeleteRequest1)
        
        saveData()
    }
}
