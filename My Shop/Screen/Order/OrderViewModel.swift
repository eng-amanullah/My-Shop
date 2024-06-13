//
//  OrderViewModel.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI
import CoreData

final class OrderViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var Orders: [OrderEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "ShopContainer")
        container.loadPersistentStores { (description, error) in
            if let error {
                print("Error loading core data \(String(describing: error))")
            }
            
            self.fetchOrders()
        }
    }
    
    func addOrderItem(name: String, price: Double, imageUrl: String, customerName: String) {
        let newItem = OrderEntity(context: container.viewContext)
        newItem.name = name
        newItem.price = price
        newItem.imageurl = imageUrl
        newItem.customername = customerName
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchOrders()
        } catch {
            print("Error for saving data \(error)")
        }
    }
    
    func fetchOrders() {
        let request = NSFetchRequest<OrderEntity>(entityName: "OrderEntity")
        
        do {
            Orders = try container.viewContext.fetch(request)
        } catch {
            print("Error \(error)")
        }
    }
}
