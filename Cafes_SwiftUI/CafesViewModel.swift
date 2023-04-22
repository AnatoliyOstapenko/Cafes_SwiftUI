//
//  CafesViewModel.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import Foundation

class CafesViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var vendors: [Vendor] = []
    @Published var filteredVendors: [Vendor] = []
    @Published var isSearching = false
    @Published var isLoading = false
    
    func debounce(interval: TimeInterval, action: @escaping () -> Void) {
        var debouncer = Debouncer(delay: interval)
        debouncer.run(action: action)
    }
    
    func loadData() async {
        let data = Data(MockData.jsonString.utf8)
        do {
            let decodedData = try JSONDecoder().decode([String:[Vendor]].self, from: data)
            DispatchQueue.main.async {
                self.vendors = decodedData["vendors"] ?? []
                self.filteredVendors = self.vendors
                self.isLoading = false
            }
        } catch {
            print("Error decoding JSON: \(error)")
            isLoading = false
        }
    }
}
