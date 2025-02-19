//
//  CircularProgressView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 18/02/25.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.accent.opacity(0.5),
                    lineWidth: 15
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.accent,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)

        }
    }
}
#Preview {
    
    let preview = Preview()
    
    CircularProgressView(progress: 0.75)
        .modelContainer(preview.modelContainer)
}
