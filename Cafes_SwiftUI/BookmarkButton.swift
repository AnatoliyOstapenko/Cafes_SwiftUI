//
//  BookmarkButton.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 23.04.2023.
//

import SwiftUI

struct BookmarkButton: View {
    @Binding var isBookmarked: Bool
    private var imageName: String {
        isBookmarked ? "bookmark.fill" : "bookmark"
    }
    
    var body: some View {
        Button {
            isBookmarked.toggle()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 36)
                    .foregroundColor(isBookmarked ? .primaryGreen : Color(.systemBackground))
                    .padding(10)
                Image(systemName: imageName)
                    .frame(width: 44, height: 44)
                    .bold()
                    .foregroundColor(isBookmarked ? Color(.systemBackground) : .primaryGreen)
            }
        }
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton(isBookmarked: .constant(false))
    }
}
