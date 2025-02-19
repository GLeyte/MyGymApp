//
//  LoadSamples.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation

extension LoadModel {
    static var samples: [LoadModel] {
        [
            LoadModel(id: UUID().uuidString, weight: 40, sets: 3, reps: "10-10-8"),
            LoadModel(id: UUID().uuidString, weight: 45, sets: 3, reps: "10-10-8"),
            LoadModel(id: UUID().uuidString, weight: 50, sets: 3, reps: "10-10-8")
        ]
    }
    
}
