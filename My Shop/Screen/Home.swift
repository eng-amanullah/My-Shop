//
//  Home.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
                List(MockData.appetizers) { item in
                    
                }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    Home()
}
