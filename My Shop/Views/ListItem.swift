//
//  ListItem.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct ListItem: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            ShopImage(imageUrl: appetizer.imageURL ?? "")
            .frame(width: 120, height: 90)
            .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(String(describing: appetizer.name))")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .padding(.leading)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ListItem(appetizer: MockData.appetizer)
}
