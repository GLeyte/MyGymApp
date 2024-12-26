//
//  Exercise.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Exercise: Identifiable, Equatable, Hashable {
    let id: String
    var name: String
    var type: ExerciseType
    var info: String
    var media: String
    var muscle: MuscleGroup
    var history: [Load]
    var lastLoad: Load? { history.last ?? nil }
}

func exerciseModel2Object(_ model: ExerciseModel) -> Exercise {
    Exercise(
        id: model.id,
        name: model.name,
        type: model.type,
        info: model.info,
        media: model.media,
        muscle: model.muscle,
        history: loadModel2Objects(model.history)
    )
}

func exerciseModel2Objects(_ models: [ExerciseModel]) -> [Exercise] {
    models.map(exerciseModel2Object)
}

func exerciseObject2Model(_ object: Exercise) -> ExerciseModel {
    ExerciseModel(
        id: object.id,
        name: object.name,
        type: object.type,
        info: object.info,
        media: object.media,
        muscle: object.muscle,
        history: loadObjects2Model(object.history)
    )
}

func exerciseObjects2Model(_ objects: [Exercise]) -> [ExerciseModel] {
    objects.map(exerciseObject2Model)
}
