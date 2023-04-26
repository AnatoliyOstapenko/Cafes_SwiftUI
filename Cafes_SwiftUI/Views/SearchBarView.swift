//
//  SearchBar.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct SearchBarView: View {    
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 10)
            Button {
                text = ""
            } label:{
                Image(systemName: "magnifyingglass")
            }
        }
        .padding()
        .tint(.secondary)
        .shadow(color: Color(.systemGray3), radius: 4, x: 0, y: 5)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant("Search..."))
    }
}
