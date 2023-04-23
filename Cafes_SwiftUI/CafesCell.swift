//
//  CafesCell.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesCell: View {    
    
    @Binding var vendor: Vendor
    
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
                }
            
            Text(vendor.companyName)
                .font(.headline)
            HStack {
                ForEach(vendor.categories) { category in
                    AsyncImage(url: category.image.mediaURL) { image in
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                    } placeholder: {
                        Image(systemName: "globe")
                    }
                    
                    Text(category.name)
                        .font(.subheadline)
                        .lineLimit(1)
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
