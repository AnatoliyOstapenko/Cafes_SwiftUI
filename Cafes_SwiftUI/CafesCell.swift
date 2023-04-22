//
//  CafesCell.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesCell: View {
    
    let filteredVendors: Vendor
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CafesCell_Previews: PreviewProvider {
    static var previews: some View {
        CafesCell(filteredVendors: MockData.mockVendor)
    }
}
