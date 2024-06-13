//
//  ContentView.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var cartViewModel: CartViewModel
        
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .badge(cartViewModel.cartItems.count)
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "chart.bar.doc.horizontal.fill")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
        .tint(.brandPrimaryColorV2)
    }
}

#Preview {
    ContentView()
}
