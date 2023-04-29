//
//  VendorService.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 27.04.2023.
//

import Foundation

protocol VendorServiceProtocol {
    func fetchVendors() async throws -> [Vendor]
}

enum VendorServiceError: LocalizedError {
    case custom(error: Error)
    case failedToDecode
    
    var errorDescription: String? {
        switch self {
        case .custom(error: let error):
            return error.localizedDescription
        case .failedToDecode:
            return "The vendor data is invalid, please try again later"
        }
    }
}

struct VendorService: VendorServiceProtocol {
    
    func fetchVendors() async throws -> [Vendor] {
        let data = Data(MockData.jsonString.utf8)
        
        do {
            let decodedData = try JSONDecoder().decode([String:[Vendor]].self, from: data)
            guard let vendors = decodedData["vendors"] else {
                throw VendorServiceError.failedToDecode
            }
            return vendors
            
        } catch {
            throw VendorServiceError.custom(error: error)
        }
    }
}
