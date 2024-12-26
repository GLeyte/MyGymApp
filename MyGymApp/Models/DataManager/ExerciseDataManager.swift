//
//  ExerciseDataManager.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftData

protocol ExerciseDataProvidable: AnyObject {
    func getItems() throws -> [Exercise]
    func add(item: Exercise) throws
    func edit(item: Exercise) throws
    func delete(item: Exercise) throws
    func reset() throws
}

class ExerciseDataProvider: ExerciseDataProvidable {
    
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getItems() throws -> [Exercise] {
        let items = try context.fetch(FetchDescriptor<ExerciseModel>())
        return items.map {
                        
            return Exercise(id: $0.id,
                     name: $0.name,
                     type: $0.type,
                     info: $0.info,
                     media: $0.media,
                     muscle: $0.muscle,
                     history: loadModel2Objects($0.history))
        }
    }
    
    func add(item: Exercise) throws {
                
        context.insert(
            ExerciseModel(name: item.name,
                          type: item.type,
                          info: item.info,
                          media: item.media,
                          muscle: item.muscle,
                          history: loadObjects2Model(item.history))
        )
        try context.save()
    }
    
    func edit(item: Exercise) throws {
        let allItems = try context.fetch(FetchDescriptor<ExerciseModel>())
        
        guard let exerciseModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "ExerciseDataProvider Edit", code: 404, userInfo: [NSLocalizedDescriptionKey: "Exercise not found"])
        }
        
        exerciseModel.name = item.name
        exerciseModel.type = item.type
        exerciseModel.info = item.info
        exerciseModel.media = item.media
        exerciseModel.muscle = item.muscle
        exerciseModel.history = loadObjects2Model(item.history)
        
        try context.save()
    }
    
    func delete(item: Exercise) throws {
        let allItems = try context.fetch(FetchDescriptor<ExerciseModel>())
        
        guard let exerciseModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "ExerciseDataProvider Delete", code: 404, userInfo: [NSLocalizedDescriptionKey: "Exercise not found"])
        }
        
        context.delete(exerciseModel)
        
        do {
            try context.save()
        } catch {
            print("DeleteExercise Error")
        }
    }
    
    func reset() throws {
        let allItems = try context.fetch(FetchDescriptor<ExerciseModel>())
        
        for item in allItems {
            context.delete(item)
        }
    }
}

class ExerciseMockDataProvider: ExerciseDataProvidable {
    
    func getItems() throws -> [Exercise] {
        
        let load_1 = Load(id: UUID().uuidString, weight: 40, sets: 3, reps: "10-10-8")
        let load_2 = Load(id: UUID().uuidString, weight: 45, sets: 3, reps: "10-10-8")
        let load_3 = Load(id: UUID().uuidString, weight: 50, sets: 3, reps: "10-10-8")
        
        return Array(repeating: Exercise(id: UUID().uuidString,
                                         name: "Barra Fixa",
                                         type: .calisthenics,
                                         info: "Suba a barra",
                                         media: "Colar video",
                                         muscle: .back,
                                         history: [load_1, load_2, load_3]),
                     count: 5)
    }
    
    func add(item: Exercise) throws { }
    
    func edit(item: Exercise) throws { }
    
    func reset() throws {}
    
    func delete(item: Exercise) throws { }
    
}
