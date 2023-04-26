//
//  Debouncer.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import Foundation

struct Debouncer {
    private let delay: TimeInterval
    private var timer: Timer?
    
    init(delay: TimeInterval) {
        self.delay = delay
    }
    mutating func run(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false, block: { _ in
            action()
        })
    }
}
