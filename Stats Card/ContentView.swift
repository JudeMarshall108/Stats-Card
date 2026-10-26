//
//  ContentView.swift
//  Stats Card
//
//  Created by Jude Burdick on 10/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = StatViewModel()
    @State private var isExpanded = false
    @Namespace private var cardAnimation
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .purple, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("My Week").font(.title).bold().foregroundStyle(.white)
                card
                Button("Refresh") { viewModel.refresh() }.foregroundStyle(.white)
            }
            .padding()
        }
    }
    private var card: some View {
        VStack(alignment: .leading, spacing: 16) {
            if isExpanded {
                expandedCard
            } else {
                collapsedCard
            }
            if isExpanded {
                ForEach(viewModel.stats) { stat in
                    StatRow(
                        name: stat.name,
                        currentValue: stat.currentValue,
                        maximumValue: stat.maximumValue,
                        fraction: stat.fraction)
                            .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
        }
        .padding(24)
        .background(.white.opacity(0.50), in: RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 12, y: 6)
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                isExpanded.toggle()
            }
        }
    }
    
    private var collapsedCard: some View {
        HStack(spacing: 16) {
            Image(systemName: "pianokeys").font(.title).matchedGeometryEffect(id: "badge", in: cardAnimation)
            VStack(alignment: .leading) {
                Text("Piano Stats").font(.headline)
                Text("\(viewModel.averagePercent)% Complete").font(.title2)
            }
        }
    }
    
    private var expandedCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                Image(systemName: "pianokeys").font(.title).matchedGeometryEffect(id: "badge", in: cardAnimation)
            }
            Text("Piano Stats")
            Text("\(viewModel.averagePercent)% Complete").font(.title2)
        }
    }
    
}

#Preview {
    ContentView()
}
