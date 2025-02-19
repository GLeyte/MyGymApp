//
//  RoutineSamples.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation

extension RoutineModel {
    
    static var samples: [RoutineModel] {
        
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
        
        let workout_1 = WorkoutModel(id: UUID().uuidString, name: "Peito", type: .calisthenics, exercises: [ex_1])
        let workout_2 = WorkoutModel(id: UUID().uuidString, name: "Triceps", type: .calisthenics, exercises: [ex_1, ex_2])
        let workout_3 = WorkoutModel(id: UUID().uuidString, name: "Biceps", type: .calisthenics, exercises: [ex_1, ex_3])
        
        return [
            RoutineModel(id: UUID().uuidString, date: .now, workout: workout_1),
            RoutineModel(id: UUID().uuidString, date: .init(timeIntervalSinceNow: -60*60*24), workout: workout_2),
            RoutineModel(id: UUID().uuidString, date: .init(timeIntervalSinceNow: -60*60*24*2), workout: workout_3),
        ]
    }
    
}
