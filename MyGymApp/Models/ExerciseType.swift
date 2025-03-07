//
//  ExerciseType.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import SwiftUICore

enum ExerciseType: String, Codable, CaseIterable, Equatable {
    case cardio
    case gym
    case calisthenics
    case warmup
    
    func getColor() -> Color {
        switch self {
        case .cardio:
            return .blue
        case .gym:
            return .green
        case .calisthenics:
            return .yellow
        case .warmup:
            return .red
        }
    }
    
    func getSymbol() -> String {
        switch self {
        case .cardio:
            return "figure.run"
        case .gym:
            return "dumbbell.fill"
        case .calisthenics:
            return "figure.play"
        case .warmup:
            return "flame.fill"
        }
    }
}
