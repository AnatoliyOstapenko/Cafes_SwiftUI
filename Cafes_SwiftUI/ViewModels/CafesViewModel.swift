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
    @Published var hasError = false
    @Published var error: VendorServiceError?
    @Published var page: Int = 0
    
    private let service: VendorServiceProtocol
    
    init(service: VendorServiceProtocol = VendorService()) {
        self.service = service
    }

    func loadData() {
        isLoading = true        
        Task {
            do {
                let vendorsResponse = try await service.fetchVendors()
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    // items are filtered by the company_name field:
                    self.filteredVendors = vendorsResponse.sorted {$0.companyName < $1.companyName }
                    self.vendors = self.filteredVendors
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.hasError = true
                    self.error = error as? VendorServiceError
                }
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
    
    func handleRefresh() {
        vendors.removeAll()
        loadData()
    }
    
    private func createDebouncer(interval: TimeInterval) -> Debouncer {
        return Debouncer(delay: interval)
    }
}
