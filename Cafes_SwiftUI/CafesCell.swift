//
//  CafesCell.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesCell: View {    
    let vendor: Vendor
    
    var body: some View {
        VStack {
            CafesImage(imageURL: vendor.imageUrl)
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
        CafesCell(vendor: MockData.mockVendor)
    }
}
