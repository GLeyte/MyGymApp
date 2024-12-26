//
//  Workout.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Workout: Identifiable, Equatable, Hashable {
    let id: String
    var name: String
    var type: ExerciseType
    var exercises: [Exercise]
}

func workoutModel2Object(_ model: WorkoutModel) -> Workout {
    Workout(
        id: model.id,
        name: model.name,
        type: model.type,
        exercises: exerciseModel2Objects(model.exercises)
    )
}

func workoutObject2Model(_ object: Workout) -> WorkoutModel {
    WorkoutModel(
        id: object.id,
        name: object.name,
        type: object.type,
        exercises: exerciseObjects2Model(object.exercises)
    )
}
