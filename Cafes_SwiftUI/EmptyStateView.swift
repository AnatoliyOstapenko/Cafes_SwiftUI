//
//  EmptyStateView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 22.04.2023.
//

import SwiftUI

struct EmptyStateView: View {
    let offset: CGFloat

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack(spacing: 8) {
                Text(Constants.emptyMainStatement)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.darkGreen)
                Text(Constants.emptySubStatement)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 27)
            }
            .offset(y: -offset)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(offset: -200)
    }
}
