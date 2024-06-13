//
//  Order.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject private var viewModel: CartViewModel
    
    @StateObject private var coreDataViewModel = CoreDataViewModel()
    @StateObject private var orderViewModel = OrderViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                NavigationStack {
                    VStack {
                        List {
                            ForEach(coreDataViewModel.cartItems) { item in
                                HStack {
                                    ShopImage(imageUrl: item.imageurl ?? "")
                                    .frame(width: 120, height: 90)
                                    .clipShape(.rect(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("\(String(describing: item.name))")
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .lineLimit(2)
                                        
                                        Text("$\(item.price, specifier: "%.2f")")
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                    }
                                    .padding(.leading)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                }
                            }
                            .onDelete(perform: coreDataViewModel.deleteCartItem)
                        }
                        .listStyle(.plain)
                        .listRowSeparator(.hidden)

                        
                        if !coreDataViewModel.cartItems.isEmpty {
                            Button(
                                action: {
//                                    ForEach(viewModel.cartItems) { item in
//
//                                    }
                                    orderViewModel.addOrderItem(name: "Burger", price: 10, imageUrl: "", customerName: "Amanullah Sarker")
                                }, label: {
                                    ShopButton(buttonTitle: "$\(coreDataViewModel.totalPrice, specifier: "%.2f") - Place Order")
                                }
                            )
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .navigationTitle("Cart")
                }
                
                if coreDataViewModel.cartItems.isEmpty {
                    EmptyCartView(imageName: "cart", title: Text("Your cart is empty. Add item for checkout."))
                }
            }
            .task {
                coreDataViewModel.fetchCartItem()
            }
            //            .alert(item: $viewModel.alertItem) { alert in
            //                Alert(title: alert.title, message: alert.message, dismissButton: alert.dissmissButton)
            //            }
        }
    }
}

#Preview {
    CartView()
}
