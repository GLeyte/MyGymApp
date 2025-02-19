//
//  RoutineDataManager.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftData

protocol RoutineDataProvidable: AnyObject {
    func getItems() throws -> [Routine]
    func add(item: Routine) throws
    func edit(item: Routine) throws
    func delete(item: Routine) throws
    func reset() throws
}

class RoutineDataProvider: RoutineDataProvidable {
    
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getItems() throws -> [Routine] {
        let items = try context.fetch(FetchDescriptor<RoutineModel>())
        return items.map {
            Routine(id: $0.id,
                    date: $0.date,
                    workout: workoutModel2Object($0.workout))
        }
    }
    
    func add(item: Routine) throws {
        
        context.insert(
            RoutineModel(date: item.date,
                         workout: workoutObject2Model(item.workout))
        )
        try context.save()
    }
    
    func edit(item: Routine) throws {
        let allItems = try context.fetch(FetchDescriptor<RoutineModel>())
        
        guard let routineModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "RoutineDataProvider Edit", code: 404, userInfo: [NSLocalizedDescriptionKey: "Routine not found"])
        }
        
        routineModel.date = item.date
        routineModel.workout = workoutObject2Model(item.workout)
        
        try context.save()
    }
    
    func delete(item: Routine) throws {
        let allItems = try context.fetch(FetchDescriptor<RoutineModel>())
        
        guard let routineModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "RoutineDataProvider Delete", code: 404, userInfo: [NSLocalizedDescriptionKey: "Routine not found"])
        }
        
        context.delete(routineModel)
        
        do {
            try context.save()
        } catch {
            print("DeleteWorkout Error")
        }
    }
    
    func reset() throws {
        let allItems = try context.fetch(FetchDescriptor<RoutineModel>())
        
        for item in allItems {
            context.delete(item)
        }
    }
}

class RoutineMockDataProvider: RoutineDataProvidable {
    
    func getItems() throws -> [Routine] {
        
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
        
        let workout_1 = Workout(id: UUID().uuidString, name: "Peito", type: .calisthenics, exercises: [ex_1])
        let workout_2 = Workout(id: UUID().uuidString, name: "Triceps", type: .gym, exercises: [ex_1, ex_2])
        let workout_3 = Workout(id: UUID().uuidString, name: "Biceps", type: .cardio, exercises: [ex_1, ex_3])
        
        return [
            Routine(id: UUID().uuidString, date: .now, workout: workout_1),
            Routine(id: UUID().uuidString, date: .init(timeIntervalSinceNow: -60*60*24), workout: workout_2),
            Routine(id: UUID().uuidString, date: .init(timeIntervalSinceNow: -60*60*24*2), workout: workout_3),
        ]
    }
    
    func add(item: Routine) throws { }
    
    func edit(item: Routine) throws { }
    
    func reset() throws {}
    
    func delete(item: Routine) throws { }
    
}
