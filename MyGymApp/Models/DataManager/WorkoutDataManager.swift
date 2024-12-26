//
//  WorkoutDataManager.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftData

protocol WorkoutDataProvidable: AnyObject {
    func getItems() throws -> [Workout]
    func add(item: Workout) throws
    func edit(item: Workout) throws
    func delete(item: Workout) throws
    func reset() throws
}

class WorkoutDataProvider: WorkoutDataProvidable {
    
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getItems() throws -> [Workout] {
        let items = try context.fetch(FetchDescriptor<WorkoutModel>())
        return items.map {
            Workout(id: $0.id,
                    name: $0.id,
                    type: $0.type,
                    exercises: exerciseModel2Objects($0.exercises))
        }
    }
    
    func add(item: Workout) throws {
        
        context.insert(
            WorkoutModel(name: item.name,
                         type: item.type,
                         exercises: exerciseObjects2Model(item.exercises))
        )
        try context.save()
    }
    
    func edit(item: Workout) throws {
        let allItems = try context.fetch(FetchDescriptor<WorkoutModel>())
        
        guard let workoutModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "WorkoutDataProvider Edit", code: 404, userInfo: [NSLocalizedDescriptionKey: "Workout not found"])
        }
        
        workoutModel.name = item.name
        workoutModel.type = item.type
        workoutModel.exercises = exerciseObjects2Model(item.exercises)
        
        try context.save()
    }
    
    func delete(item: Workout) throws {
        let allItems = try context.fetch(FetchDescriptor<WorkoutModel>())
        
        guard let workoutModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "WorkoutDataProvider Delete", code: 404, userInfo: [NSLocalizedDescriptionKey: "Workout not found"])
        }
        
        context.delete(workoutModel)
        
        do {
            try context.save()
        } catch {
            print("DeleteWorkout Error")
        }
    }
    
    func reset() throws {
        let allItems = try context.fetch(FetchDescriptor<WorkoutModel>())
        
        for item in allItems {
            context.delete(item)
        }
    }
}

class WorkoutMockDataProvider: WorkoutDataProvidable {
    
    func getItems() throws -> [Workout] {
        
        let load = Load(id: UUID().uuidString, weight: 40, sets: 3, reps: "10-10-8")
        
        let ex_1 = Exercise(id: UUID().uuidString,
                            name: "Flexão",
                            type: .calisthenics,
                            info: "No chão",
                            media: "Video",
                            muscle: .chest,
                            history: [load])
        
        let ex_2 = Exercise(id: UUID().uuidString,
                            name: "Flexão Diamente",
                            type: .calisthenics,
                            info: "No chão",
                            media: "Video",
                            muscle: .chest,
                            history: [load])
        
        let ex_3 = Exercise(id: UUID().uuidString,
                            name: "Flexão Hindu",
                            type: .calisthenics,
                            info: "No chão",
                            media: "Video",
                            muscle: .chest,
                            history: [load])
        
        return [
            Workout(id: UUID().uuidString, name: "Peito", type: .calisthenics, exercises: [ex_1, ex_2, ex_3]),
            Workout(id: UUID().uuidString, name: "Triceps", type: .calisthenics, exercises: [ex_1]),
            Workout(id: UUID().uuidString, name: "Biceps", type: .calisthenics, exercises: [ex_1, ex_3])
        ]
    }
    
    func add(item: Workout) throws { }
    
    func edit(item: Workout) throws { }
    
    func reset() throws {}
    
    func delete(item: Workout) throws { }
    
}
