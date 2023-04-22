//
//  CafesView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesView: View {
    @ObservedObject private var viewModel = CafesViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
            List(viewModel.filteredVendors) { vendor in
                VStack {
                    AsyncImage(url: vendor.imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 360,
                                   height: 190)
                            .cornerRadius(8)
                            .shadow(color: Color(.systemGray3), radius: 4, x: 0, y: 5)
                    } placeholder: {
                        Image("noImage")
                            .resizable()
                            .imageScale(.small)
                            .frame(width: 390,
                                   height: 210)
                            .cornerRadius(8)
                    }
                    VStack(alignment: .leading) {
                        Text(vendor.company_name)
                            .font(.headline)
                        Text(vendor.shop_type)
                            .font(.subheadline)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .task {
               await viewModel.loadData()
            }
            .onChange(of: viewModel.searchText) { text in
                viewModel.isSearching = true
                viewModel.debounce(interval: 0.5) {
                    if text.count >= 3 {
                        viewModel.filteredVendors = viewModel.vendors.filter { vendor in
                            vendor.company_name.localizedCaseInsensitiveContains(text)
                        }
                    } else {
                        viewModel.filteredVendors = viewModel.vendors
                    }
                    viewModel.isSearching = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CafesView()
    }
}

