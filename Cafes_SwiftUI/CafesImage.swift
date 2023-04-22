//
//  CafesImage.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 22.04.2023.
//

import SwiftUI

struct CafesImage: View {    
    let imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 360,
                       height: 190)
                .cornerRadius(8)
                .shadow(color: Color(.systemGray3), radius: 4, x: 0, y: 5)
        } placeholder: {
            Image("noImage")
                .resizable()
                .imageScale(.small)
                .frame(width: 390,
                       height: 210)
                .cornerRadius(8)
        }
    }
}

struct CafesImage_Previews: PreviewProvider {
    static var previews: some View {
        CafesImage(imageURL: MockData.mockVendor.imageUrl)
    }
}