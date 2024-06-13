//
//  MyShopApp.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

@main
struct MyShopApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isEnglish") private var isEnglish = false
    
    @State private var networkMonitor = NetworkMonitor()
    @State var languageSettings = LanguageSetting()
    
    var orderViewModel = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            CoreDataView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(languageSettings)
                .environment(\.locale, isEnglish ? languageSettings.en : languageSettings.bn)
                .environmentObject(orderViewModel)
            //.environment(networkMonitor)
        }
    }
}
