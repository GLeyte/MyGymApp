//
//  LoadDataManager.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftData

protocol LoadDataProvidable: AnyObject {
    func getItems() throws -> [Load]
    func add(item: Load) throws
    func edit(item: Load) throws
    func delete(item: Load) throws
    func reset() throws
}

class LoadDataProvider: LoadDataProvidable {
    
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getItems() throws -> [Load] {
        let items = try context.fetch(FetchDescriptor<LoadModel>())
        return items.map {
            Load(id: $0.id,
                 weight: $0.weight,
                 sets: $0.sets,
                 reps: $0.reps,
                 duration: $0.duration,
                 timeType: $0.timeType,
                 distance: $0.distance,
                 date: $0.date)
        }
    }
    
    func add(item: Load) throws {
        context.insert(
            LoadModel(weight: item.weight,
                      sets: item.sets,
                      reps: item.reps,
                      duration: item.duration,
                      timeType: item.timeType,
                      distance: item.distance,
                      date: item.date)
        )
        try context.save()
    }
    
    func edit(item: Load) throws {
        let allItems = try context.fetch(FetchDescriptor<LoadModel>())
        
        guard let loadModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "LoadtDataProvider Edit", code: 404, userInfo: [NSLocalizedDescriptionKey: "Load not found"])
        }
        
        loadModel.weight = item.weight
        loadModel.sets = item.sets
        loadModel.reps = item.reps
        loadModel.duration = item.duration
        loadModel.timeType = item.timeType
        loadModel.distance = item.distance
        loadModel.date = item.date
        try context.save()
    }
    
    func delete(item: Load) throws {
        let allItems = try context.fetch(FetchDescriptor<LoadModel>())
        
        guard let loadModel = allItems.first(where: { $0.id == item.id }) else {
            throw NSError(domain: "LoadDataProvider Delete", code: 404, userInfo: [NSLocalizedDescriptionKey: "Load not found"])
        }
        
        context.delete(loadModel)
        
        do {
            try context.save()
        } catch {
            print("DeleteLoad Error")
        }
    }
    
    func reset() throws {
        let allItems = try context.fetch(FetchDescriptor<LoadModel>())
        
        for item in allItems {
            context.delete(item)
        }
    }
}

class LoadMockDataProvider: LoadDataProvidable {
    
    func getItems() throws -> [Load] {
        return Array(repeating: Load(id: UUID().uuidString, weight: 50, sets: 3, reps: "10-10-8"), count: 5)
    }
    
    func add(item: Load) throws { }
    
    func edit(item: Load) throws { }
    
    func reset() throws {}
    
    func delete(item: Load) throws { }
    
}
