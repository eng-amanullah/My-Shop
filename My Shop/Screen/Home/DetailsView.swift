//
//  Details.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct DetailsView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    @StateObject private var coreDataViewModel = CoreDataViewModel()
    
    let appetizer: Appetizer
    
    @Binding var isDetailsClicked: Bool
        
    var body: some View {
            VStack {
                ZStack(alignment: .top) {
                    ShopImage(imageUrl: appetizer.imageURL ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 250)
                }
                
                VStack(spacing: 10) {
                    Text("\(appetizer.name)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .fontWeight(.medium)
                    
                    Text("\(String(describing: appetizer.description))")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .fontWeight(.regular)
                    
                    HStack {
                        NutritionInfo(nutritionTitle: Text("Calories"), nutritionValue: String(appetizer.calories ?? 0))
                        
                        Spacer()
                        
                        NutritionInfo(nutritionTitle: Text("Carbs"), nutritionValue: String(appetizer.carbs ?? 0))
                        
                        Spacer()
                        
                        NutritionInfo(nutritionTitle: Text("Protein"), nutritionValue: String(appetizer.protein ?? 0))
                    }
                    .padding(.vertical)
                    
                    Button(
                        action: {
                            //cartViewModel.addItemInCart(appetizer: appetizer)
                            coreDataViewModel.addCartItem(name: appetizer.name, price: appetizer.price, imageUrl: appetizer.imageURL ?? "")
                            isDetailsClicked = false
                        }, label: {
                            ShopButton(buttonTitle: "$\(appetizer.price, specifier: "%.2f") - Add to Cart")
                        }
                    )
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .overlay(
                Button {
                    isDetailsClicked = false
                }
                label: {
                    ShopCancelButton(roundBackgroundColor: .white, imageName: "xmark", imageColor: .brandPrimaryColorV2)
                }, alignment: .topTrailing
            )
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 40)
            .padding(.all, 20)
        }
}

struct NutritionInfo: View {
    
    let nutritionTitle: Text
    let nutritionValue: String
    
    var body: some View {
        VStack {
            nutritionTitle
                .font(.title2)
                .fontWeight(.medium)
            
            Text(nutritionValue)
                .font(.title2)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    DetailsView(appetizer: MockData.appetizer, isDetailsClicked: .constant(true))
}
