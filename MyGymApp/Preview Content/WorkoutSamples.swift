//
//  WorkoutSamples.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation

extension WorkoutModel {
    
    static var samples: [WorkoutModel] {
        
        let load = LoadModel(id: UUID().uuidString, weight: 40, sets: 3, reps: "10-10-8")
        
        let ex_1 = ExerciseModel(id: UUID().uuidString,
                            name: "Flexão",
                            type: .calisthenics,
                            info: "No chão",
                            media: "Video",
                            muscle: .chest,
                            history: [load])
        
        let ex_2 = ExerciseModel(id: UUID().uuidString,
                            name: "Flexão Diamente",
                            type: .calisthenics,
                            info: "No chão",
                            media: "Video",
                            muscle: .chest,
                            history: [load])
        
        let ex_3 = ExerciseModel(id: UUID().uuidString,
                            name: "Flexão Hindu",
                            type: .calisthenics,
                            info: "No chão",
                            media: "Video",
                            muscle: .chest,
                            history: [load])
        
        return [
            WorkoutModel(id: UUID().uuidString, name: "Peito", type: .calisthenics, exercises: [ex_1, ex_2, ex_3]),
            WorkoutModel(id: UUID().uuidString, name: "Triceps", type: .calisthenics, exercises: [ex_1]),
            WorkoutModel(id: UUID().uuidString, name: "Biceps", type: .calisthenics, exercises: [ex_1, ex_3])
        ]
    }
    
}
