//
//  CafesCell.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

enum TagSymbol { case dot, svg }

struct CafesCell: View {    
    
    @Binding var vendor: Vendor
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    private var numberOfTagsPerRow: Int {
        return verticalSizeClass == .regular ? 2 : 4
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CafesImage(imageURL: vendor.coverPhoto.mediaURL)
                .overlay(alignment: .bottomLeading) {
                    AreaLabelView(area: vendor.areaServed)
                }
                .overlay(alignment: .topTrailing) {
                    Toggle(isOn: $vendor.favorited) {
                        BookmarkView(isFavorited: $vendor.favorited)
                    }
                    .toggleStyle(.button)
                    .buttonStyle(.plain)
                }
            CompanyNameView(companyName: vendor.companyName)
            // Categories:
            TagView(tags: vendor.categories, symbol: .svg)
            // Tags:
            TagView(tags: vendor.tags, symbol: .dot)
        }
        .listRowSeparator(.hidden)
    }
}

struct CafesCell_Previews: PreviewProvider {
    static var previews: some View {
        CafesCell(vendor: .constant(MockData.mockVendor))
    }
}

struct AreaLabelView: View {
    let area: String
    
    var body: some View {
        Text(area)
            .padding(6)
            .padding(.horizontal, 8)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .padding(8)
    }
}

struct CompanyNameView: View {
    let companyName: String
    
    var body: some View {
        Text(companyName)
            .font(.title2)
            .fontWeight(.medium)
    }
}
