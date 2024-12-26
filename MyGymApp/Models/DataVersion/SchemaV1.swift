//
//  SchemaV1.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftData

enum SchemaV1: VersionedSchema {
    
    static var versionIdentifier: Schema.Version = Schema.Version(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [LoadModel.self, ExerciseModel.self, WorkoutModel.self, RoutineModel.self]
    }
    
    @Model
    class LoadModel: Identifiable {
        var id: String = UUID().uuidString
        var weight: Double?
        var sets: Int?
        var reps: String?
        var duration: Double?
        var timeType: TimeType?
        var distance: Double?
        var date: Date?
        
        init(id: String = UUID().uuidString, weight: Double? = nil, sets: Int? = nil, reps: String? = nil, duration: Double? = nil, timeType: TimeType? = nil, distance: Double? = nil, date: Date? = nil) {
            self.id = id
            self.weight = weight
            self.sets = sets
            self.reps = reps
            self.duration = duration
            self.timeType = timeType
            self.distance = distance
            self.date = date
        }
    }
    
    @Model
    class ExerciseModel: Identifiable {
        var id: String = UUID().uuidString
        var name: String
        var type: ExerciseType
        var info: String
        var media: String
        var muscle: MuscleGroup
        var history: [LoadModel]
        var lastLoad: LoadModel? { history.last ?? nil }
        
        init(id: String = UUID().uuidString, name: String, type: ExerciseType, info: String, media: String, muscle: MuscleGroup, history: [LoadModel]) {
            self.id = id
            self.name = name
            self.type = type
            self.info = info
            self.media = media
            self.muscle = muscle
            self.history = history
        }
    }
    
    @Model
    class WorkoutModel: Identifiable {
        var id: String = UUID().uuidString
        var name: String
        var type: ExerciseType
        var exercises: [ExerciseModel]
        
        init(id: String = UUID().uuidString, name: String, type: ExerciseType, exercises: [ExerciseModel]) {
            self.id = id
            self.name = name
            self.type = type
            self.exercises = exercises
        }
    }
    
    @Model
    class RoutineModel: Identifiable {
        var id: String = UUID().uuidString
        var date: Date
        var workout: WorkoutModel
        
        init(id: String = UUID().uuidString, date: Date, workout: WorkoutModel) {
            self.id = id
            self.date = date
            self.workout = workout
        }
    }
}
