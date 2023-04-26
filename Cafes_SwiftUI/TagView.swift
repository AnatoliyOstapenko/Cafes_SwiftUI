//
//  TagView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 25.04.2023.
//

import SwiftUI

protocol Taggable: Codable, Hashable, Identifiable {
    var name: String { get }
}

struct TagView<T: Taggable>: View {
    
    let tags: [T]
    private var groupedItems: [[T]] = []
    private let screenWidth = UIScreen.main.bounds.width
    let symbol: TagSymbol
    
    init(tags: [T], symbol: TagSymbol) {
        self.tags = tags
        self.symbol = symbol
        self.groupedItems = createGropedItems(tags)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { tag in
                        if symbol == .dot {
                            Text("• \(tag.name)")
                                .font(.system(size: 18, weight: .medium))
                                .lineLimit(1)
                                .foregroundColor(.secondary)
                        } else {
                            HStack {
                                Image(systemName: "globe")
                                Text(tag.name)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(1)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func createGropedItems(_ items: [T]) -> [[T]] {
        var groupedItems: [[T]] = []
        var temporaryItems: [T] = []
        var width: CGFloat = 0
        
        for tag in items {
            let label = UILabel()
            label.text = "• \(tag.name)"
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 38
            
            if (width + labelWidth + 38) < screenWidth {
                width += labelWidth
                temporaryItems.append(tag)
            } else {
                width = labelWidth
                groupedItems.append(temporaryItems)
                temporaryItems.removeAll()
                temporaryItems.append(tag)
            }
        }
        groupedItems.append(temporaryItems)
        return groupedItems
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        CafesView()
    }
}
