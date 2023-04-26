//
//  CafesAPIModel.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import Foundation
import SwiftUI

struct Vendor: Codable, Identifiable {
    let id: Int
    let companyName: String
    let areaServed: String
    let shopType: String
    var favorited: Bool
    let follow: Bool
    let businessType: String
    let coverPhoto: CoverPhoto
    let categories: [Category]
    let tags: [Tag]
    
    enum CodingKeys: String, CodingKey {
        case id, favorited, follow, categories, tags
        case companyName = "company_name"
        case areaServed = "area_served"
        case shopType = "shop_type"
        case businessType = "business_type"
        case coverPhoto = "cover_photo"
    }
}

struct CoverPhoto: Codable {
    let id: Int
    let mediaURL: URL
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaURL = "media_url"
        case mediaType = "media_type"
    }
}

struct Category: Codable, Identifiable, Hashable, Taggable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.name == rhs.name
    }
    
    let id: Int
    let name: String
    let image: CategoryImage
}

struct CategoryImage: Codable, Hashable {
    let id: Int
    let mediaURL: URL
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaURL = "media_url"
        case mediaType = "media_type"
    }
}

struct Tag: Codable, Identifiable, Hashable, Taggable {
    let id: Int
    let name: String
    let purpose: String
}
