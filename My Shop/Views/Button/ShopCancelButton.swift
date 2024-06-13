//
//  ShopCancelButton.swift
//  My Shop
//
//  Created by Amanullah Sarker on 11/6/24.
//

import SwiftUI

struct ShopCancelButton: View {
    
    let roundBackgroundColor: Color
    let imageName: String
    let imageColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(roundBackgroundColor)
                .opacity(0.6)
            Image(systemName: imageName)
                .imageScale(.small)
                .tint(imageColor)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    ShopCancelButton(roundBackgroundColor: .white, imageName: "xmark", imageColor: .brandPrimaryColorV2)
}
