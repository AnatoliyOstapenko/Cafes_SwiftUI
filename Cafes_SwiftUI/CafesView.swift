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
            SearchBar(text: $viewModel.searchText, isEditing: $viewModel.isSearching)
            List(viewModel.filteredVendors) { vendor in
                VStack {
                    AsyncImage(url: vendor.imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 360,
                                   height: 200)
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
            .onAppear(perform: loadData)
            .onChange(of: viewModel.searchText) { text in
                viewModel.isSearching = true
                debounce(interval: 0.5) {
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
    
    private func debounce(interval: TimeInterval, action: @escaping () -> Void) {
        var debouncer = Debouncer(delay: interval)
        debouncer.run(action: action)
    }
    
    private func loadData() {
        let data = Data(MockData.jsonString.utf8)
        
        do {
            let decodedData = try JSONDecoder().decode([String:[Vendor]].self, from: data)
            viewModel.vendors = decodedData["vendors"] ?? []
            viewModel.filteredVendors = viewModel.vendors
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CafesView()
    }
}

