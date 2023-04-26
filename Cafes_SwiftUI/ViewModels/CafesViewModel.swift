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
    @Published var isLoading = false

    func loadData() async {
        let data = Data(MockData.jsonString.utf8)
        do {
            let decodedData = try JSONDecoder().decode([String:[Vendor]].self, from: data)
            DispatchQueue.main.async {
                self.vendors = decodedData["vendors"] ?? []
                
                // items are filtered by the company_name field:
                self.filteredVendors = self.vendors.sorted {$0.companyName < $1.companyName }
                self.vendors.sort {$0.companyName < $1.companyName}
                self.isLoading = false
            }
        } catch {
            print("Error decoding JSON: \(error)")
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    // The search starts automatically after a user has typed at least 3 symbols, with a 0.5-second debouncing period:
    func filterVendors() {
        var debouncer = createDebouncer(interval: 0.5)
        
        debouncer.run(action: {
            guard self.searchText.count >= 3 else {
                self.filteredVendors = self.vendors
                return
            }
            
            self.filteredVendors = self.vendors.filter { $0.companyName.localizedCaseInsensitiveContains(self.searchText)}
        })
    }
    
    private func createDebouncer(interval: TimeInterval) -> Debouncer {
        return Debouncer(delay: interval)
    }
}
