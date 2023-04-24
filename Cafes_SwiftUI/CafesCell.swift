//
//  CafesCell.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesCell: View {    
    
    @Binding var vendor: Vendor
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    private var numberOfTagsPerRow: Int {
        return verticalSizeClass == .regular ? 2 : 4
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CafesImage(imageURL: vendor.coverPhoto.mediaURL)
                .overlay(alignment: .bottomLeading) {
                    Text(vendor.areaServed)
                        .padding(6)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .padding(8)
                }
                .overlay(alignment: .topTrailing) {
                    Toggle(isOn: $vendor.favorited) {
                        BookmarkView(isFavorited: $vendor.favorited)
                    }
                    .toggleStyle(.button)
                    .buttonStyle(.plain)
                }
            
            Text(vendor.companyName)
                .font(.title2)
                .fontWeight(.medium)
            
            
            ForEach(0..<vendor.categories.count/numberOfTagsPerRow, id: \.self) { rowIndex in
                HStack(spacing: 10) {
                    ForEach(vendor.categories.dropFirst(rowIndex * numberOfTagsPerRow).prefix(numberOfTagsPerRow)) { category in
                        HStack {
                            Image(systemName: "globe")
                            Text(category.name)
                                .font(.system(size: 18, weight: .medium))
                                .lineLimit(1)
                        }
                    }
                }
            }
        }
        .listRowSeparator(.hidden)
    }
}

struct CafesCell_Previews: PreviewProvider {
    static var previews: some View {
        CafesCell(vendor: .constant(MockData.mockVendor))
    }
}
