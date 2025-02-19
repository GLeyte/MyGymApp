//
//  ExerciseSamples.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation

extension ExerciseModel {
    static var samples: [ExerciseModel] {
        
        let load_1 = LoadModel(id: UUID().uuidString, weight: 40, sets: 3, reps: "10-10-8")
        let load_2 = LoadModel(id: UUID().uuidString, weight: 45, sets: 3, reps: "10-10-8")
        let load_3 = LoadModel(id: UUID().uuidString, weight: 50, sets: 3, reps: "10-10-8")
        
        return [
            ExerciseModel(id: UUID().uuidString,
                          name: "Barra Fixa",
                          type: .calisthenics,
                          info: "Suba a barra",
                          media: "Colar video",
                          muscle: .back,
                          history: [load_1, load_2, load_3]),
            
            ExerciseModel(id: UUID().uuidString,
                          name: "Agachamento",
                          type: .calisthenics,
                          info: "Agache",
                          media: "Colar video",
                          muscle: .back,
                          history: [load_1, load_2, load_3]),
            
            ExerciseModel(id: UUID().uuidString,
                          name: "Flexao",
                          type: .calisthenics,
                          info: "Va ao chao",
                          media: "Colar video",
                          muscle: .back,
                          history: [load_1, load_2, load_3])
        ]
    }
    
}
