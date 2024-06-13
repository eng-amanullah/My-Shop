//
//  CoreDataView.swift
//  My Shop
//
//  Created by Amanullah Sarker on 12/6/24.
//

import SwiftUI

struct CoreDataView: View {
    
    @StateObject private var vm = CoreDataViewModel()
    
    @StateObject private var orderViewModel = OrderViewModel()
    
    @State private var nameTextField: String = ""
    @State private var priceTextField: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter Item Name", text: $nameTextField)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(.gray)
                    .padding()
                    .foregroundStyle(.white)
                
                TextField("Enter Item Price", text: $priceTextField)
                    .padding()
                    .background(.gray)
                    .padding()
                    .foregroundStyle(.white)
                    .keyboardType(.numberPad)
                
                Button(
                    action: {
                        guard !nameTextField.isEmpty && !priceTextField.isEmpty else {
                            return
                        }
                        
                        vm.addCartItem(name: nameTextField, price: Double(priceTextField) ?? 0.0, imageUrl: "")
                        
                        nameTextField = ""
                        priceTextField = ""
                    }, label: {
                        ShopButton(buttonTitle: "Save data")
                    }
                )
                .padding()
                
                List {
                    ForEach(orderViewModel.Orders) { item in
                        
                        Text("\(item.name ?? "") -> \(item.price)")
                    }
                    .onDelete(perform: vm.deleteCartItem)
                }
            }
            .navigationTitle("Core Data")
        }
    }
}

#Preview {
    CoreDataView()
}
