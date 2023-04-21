//
//  CafesAPIModel.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import Foundation

struct Vendor: Codable, Identifiable {
    let id: Int
    let company_name: String
    let area_served: String
    let shop_type: String
    let favorited: Bool
    let follow: Bool
    let business_type: String
    let cover_photo: CoverPhoto
    let categories: [Category]
    let tags: [Tag]
    
    var imageUrl: URL? {
        URL(string: cover_photo.media_url)
    }
}

struct CoverPhoto: Codable {
    let id: Int
    let media_url: String
    let media_type: String
}

struct Category: Codable {
    let id: Int
    let name: String
    let image: ImageData
    
    struct ImageData: Codable {
        let id: Int
        let media_url: String
        let media_type: String
        
        var imageUrl: URL? {
            URL(string: media_url)
        }
    }
}

struct Tag: Codable {
    let id: Int
    let name: String
    let purpose: String
}
