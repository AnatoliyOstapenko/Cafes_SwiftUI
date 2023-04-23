//
//  CafesCell.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesCell: View {    
    
    let vendor: Vendor
    @Binding var isBookmarked: Bool
    
    var body: some View {
        VStack {
            CafesImage(imageURL: vendor.imageUrl)
                .overlay(alignment: .bottomLeading) {
                    Text("City of london")
                        .padding(6)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .padding(8)
                }
                .overlay(alignment: .topTrailing) {
                    BookmarkButton(isBookmarked: $isBookmarked)
                }
            VStack(alignment: .leading) {
                Text(vendor.company_name)
                    .font(.headline)
                Text(vendor.shop_type)
                    .font(.subheadline)
            }
        }
        .listRowSeparator(.hidden)
    }
}

struct CafesCell_Previews: PreviewProvider {
    static var previews: some View {
        CafesCell(vendor: MockData.mockVendor, isBookmarked: .constant(false))
    }
}
