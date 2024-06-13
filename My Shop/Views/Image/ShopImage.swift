//
//  ShopImage.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

struct ShopImage: View {
    
    let imageUrl: String
    
    var body: some View {
        AsyncCachedImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    ShopImage(imageUrl: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg")
}
