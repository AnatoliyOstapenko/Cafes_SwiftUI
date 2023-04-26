//
//  Cafes_SwiftUIApp.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct Cafes_SwiftUIApp: App {
    
    init() {
        setUpDependencies() // Initialize SVGCoder
    }
    
    var body: some Scene {
        WindowGroup {
            CafesView()
        }
    }
}

// Initialize SVGCoder
private extension Cafes_SwiftUIApp {
    func setUpDependencies() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
