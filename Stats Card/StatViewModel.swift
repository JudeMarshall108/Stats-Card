//
//  StatViewModel.swift
//  Stats Card
//
//  Created by Jude Burdick on 10/26/26.
//

import SwiftUI
import Observation

@Observable
class StatViewModel {
    private(set) var stats: [StatItem] = [
        StatItem(name: "Piano Scales", currentValue: 15, maximumValue: 30),
        StatItem(name: "Piano Tech Coursework", currentValue: 45, maximumValue: 60),
        StatItem(name: "Sight Reading", currentValue: 20, maximumValue: 45),
        StatItem(name: "Chapel Band Practice", currentValue: 20, maximumValue: 30)
    ]
    
    func refresh() {
        for index in stats.indices {
            let maximum = stats[index].maximumValue
            stats[index].currentValue = Double.random(in: 0...maximum)
        }
    }
    
    var averagePercent: Int {
        guard !stats.isEmpty else { return 0 }
        let total = stats.reduce(0.0) { $0 + $1.fraction }
        return Int(total / Double(stats.count) * 100)
    }
}
