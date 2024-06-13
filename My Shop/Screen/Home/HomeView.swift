//
//  HomeView.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
        
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    List {
                        ForEach(viewModel.appetizers) { item in
                            ListItem(appetizer: item)
                                .listRowSeparator(.hidden, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                .onTapGesture {
                                    viewModel.isDetailsClicked = true
                                    viewModel.detailsAppetizer = item
                                }
                        }
                    }
                    .listStyle(.plain)
                }
                .scrollIndicators(.hidden)
                .navigationTitle("Home")
                .disabled(viewModel.isDetailsClicked)
            }
            .blur(radius: viewModel.isDetailsClicked ? 20 : 0)
            .task {
                viewModel.getAppetizers()
            }
            .refreshable {
                viewModel.isRefreshing = true
                viewModel.getAppetizers()
            }
            
            if viewModel.isDetailsClicked {
                DetailsView(appetizer: viewModel.detailsAppetizer ?? MockData.appetizer,
                            isDetailsClicked: $viewModel.isDetailsClicked)
            }
            
            if viewModel.isLoading && !viewModel.isDetailsClicked && !viewModel.isRefreshing {
                DotLoader()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dissmissButton)
        }
    }
}

#Preview {
    HomeView()
}
