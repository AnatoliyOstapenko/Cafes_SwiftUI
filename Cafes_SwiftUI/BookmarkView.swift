//
//  BookmarkView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 23.04.2023.
//

import SwiftUI

struct BookmarkView: View {
    
    @Binding var isFavorited: Bool
    private var imageName: String {
        isFavorited ? "bookmark.fill" : "bookmark"
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 36)
                .foregroundColor(isFavorited ? .primaryGreen : Color(.systemBackground))
                .padding(10)
            Image(systemName: imageName)
                .frame(width: 44, height: 44)
                .bold()
                .foregroundColor(isFavorited ? Color(.systemBackground) : .primaryGreen)
        }
    }
}

struct BookmarkView_Preview: PreviewProvider {
    static var previews: some View {
        BookmarkView(isFavorited: .constant(false))
    }
}
