//
//  OrderView.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject private var orderViewModel = OrderViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                NavigationStack {
                    VStack {
                        List {
                            ForEach(orderViewModel.Orders, id: \.self) { item in
                                HStack {
                                    ShopImage(imageUrl: item.imageurl ?? "")
                                    .frame(width: 120, height: 90)
                                    .clipShape(.rect(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(item.name ?? "")
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .lineLimit(2)
                                        
                                        Text("$\(item.price, specifier: "%.2f")")
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        
                                        Text(item.customername ?? "")
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .lineLimit(2)
                                    }
                                    .padding(.leading)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                .navigationTitle("Order")
            }
            
            if orderViewModel.Orders.isEmpty {
                EmptyCartView(imageName: "cart", title: Text("Your order is empty"))
            }
        }
        //            .alert(item: $viewModel.alertItem) { alert in
        //                Alert(title: alert.title, message: alert.message, dismissButton: alert.dissmissButton)
        //            }
    }
}

#Preview {
    OrderView()
}
