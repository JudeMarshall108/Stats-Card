//
//  StatRow.swift
//  Stats Card
//
//  Created by Jude Burdick on 10/26/26.
//

import SwiftUI

struct StatRow: View {
    let name: String
    let currentValue: Double
    let maximumValue: Double
    let fraction: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                Spacer()
                Text("\(Int(currentValue)) / \(Int(maximumValue))").opacity(0.5)
            }
            .frame(width: 250)
            progressBar
        }
    }
    
    private var progressBar: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(.gray.opacity(0.2))
            Capsule()
                .fill(.blue)
                .frame(width: 250 * fraction)
                .animation(.easeInOut(duration: 0.7), value: fraction)
        }
        .frame(width: 250, height: 12)
    }
}

#Preview {
    StatRow(name: "Piano Scales", currentValue: 15, maximumValue: 30, fraction: 0.75)
}
