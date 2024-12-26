//
//  Load.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Load: Identifiable, Equatable, Hashable {
    let id: String
    var weight: Double?
    var sets: Int?
    var reps: String?
    var duration: Double?
    var timeType: TimeType?
    var distance: Double?
    var date: Date?
    
}

func loadModel2Object(_ model: LoadModel) -> Load {
    Load(id: model.id,
         weight: model.weight,
         sets: model.sets,
         reps: model.reps,
         duration: model.duration,
         timeType: model.timeType,
         distance: model.distance,
         date: model.date)
}

func loadModel2Objects(_ models: [LoadModel]) -> [Load] {
    models.map(loadModel2Object)
}

func loadObject2Model(_ object: Load) -> LoadModel {
    LoadModel(id: object.id,
              weight: object.weight,
              sets: object.sets,
              reps: object.reps,
              duration: object.duration,
              timeType: object.timeType,
              distance: object.distance,
              date: object.date)
}

func loadObjects2Model(_ objects: [Load]) -> [LoadModel] {
    objects.map(loadObject2Model)
}
