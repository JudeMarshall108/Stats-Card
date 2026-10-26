//
//  StatItem.swift
//  Stats Card
//
//  Created by Jude Burdick on 10/26/26.
//

import Foundation

struct StatItem: Identifiable {
    let id = UUID()
    let name: String
    var currentValue: Double
    let maximumValue: Double
    var fraction: Double {
        min(max(currentValue / maximumValue, 0), 1)
    }
}
