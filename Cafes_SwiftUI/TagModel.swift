//
//  TagModel.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 25.04.2023.
//

import Foundation

struct TagModel: Identifiable, Hashable {
    let id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}
