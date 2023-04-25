//
//  TagView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 25.04.2023.
//

import SwiftUI

struct TagView: View {
    var maxLimit: Int
    @State var tags: [Tag]
    
    var fontSize: CGFloat = 16
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Add some tags...")
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(getRows(), id: \.self) { rows in
                        HStack {
                            ForEach(rows) { row in
                                RowView(tag: row)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
                .padding(.vertical)
                .environment(\.colorScheme, .dark)
            }
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color(.white), lineWidth: 2)
            }
        }
        .onChange(of: tags) { newValue in
            guard let last = tags.last else { return }
            
            // Getting text size:
            let font = UIFont.systemFont(ofSize: fontSize)
            let attributes = [NSAttributedString.Key.font: font]
            let size = (last.name as NSString).size(withAttributes: attributes)
            print(size)
            
            // Updating size:
            tags[getIndex(tag: last)].size = size.width
        }
    }
    
    @ViewBuilder
    func RowView(tag: Tag) -> some View {
        Text(tag.name)
            .font(.system(size: fontSize))
            .padding(8)
            .padding(.horizontal, 14)
            .background(.cyan)
            .cornerRadius(14)
            .lineLimit(1)
        
    }
    
    func getIndex(tag: Tag) -> Int {
        let index = tags.firstIndex {tag.id == $0.id} ?? 0
        return index
    }
    
    func getRows() -> [[Tag]] {
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        var totalWidth: CGFloat = 0
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        // calculating width
        tags.forEach { tag in
            totalWidth += tag.size + 32
            if totalWidth > screenWidth {
                totalWidth = !currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            } else {
                currentRow.append(tag)
            }
        }
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        CafesView()
    }
}
