//
//  VendorService.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 27.04.2023.
//

import Foundation

enum VendorServiceError: LocalizedError {
    case custom(error: Error)
    case failedToDecode
    
    var errorDescription: String? {
        switch self {
        case .custom(error: let error):
            return error.localizedDescription
        case .failedToDecode:
            return "Failed to decode response"
        }
    }
}

struct VendorService {
    
    static let shared = VendorService()
    private init() {}
    
    func fetchVendors() async throws -> [Vendor] {
        let data = Data(MockData.jsonString.utf8)
        
        do {
            let decodedData = try JSONDecoder().decode([String:[Vendor]].self, from: data)
            guard let vendor = decodedData["vendors"] else {
                throw VendorServiceError.failedToDecode
            }
            return vendor
        } catch {
            throw VendorServiceError.custom(error: error)
        }
    }
}
