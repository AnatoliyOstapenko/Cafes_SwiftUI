//
//  TagView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 25.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

protocol Taggable: Codable, Hashable, Identifiable {
    var name: String { get }
    var image: CategoryImage { get }
}

extension Taggable {
    var image: CategoryImage {
       fatalError()
    }
}

struct TagView <T: Taggable>: View {
    let tags: [T]
    let symbol: TagSymbol
    private var groupedItems: [[T]] = []
    private let screenWidth = UIScreen.main.bounds.width
    
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
                                WebImage(url: tag.image.mediaURL)
                                    .resizable()
                                    .placeholder(Image(systemName: "globe"))
                                    .scaledToFit()
                                    .frame(width: 20)
                                Text(tag.name)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(1)
                                    .foregroundColor(Color(.darkGray))
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
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 32) < screenWidth {
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
