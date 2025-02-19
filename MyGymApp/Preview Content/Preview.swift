//
//  Preview.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation
import SwiftData

struct Preview {
    
    let modelContainer: ModelContainer
    init() {
        let sharedModelContainer: ModelContainer = {
            let schema = Schema(versionedSchema: SchemaLatest.self)
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        modelContainer = sharedModelContainer
    }
    
    func addLoadSamples() {
        
        let samples = LoadModel.samples
        Task { @MainActor in
            samples.forEach { example in
                modelContainer.mainContext.insert(example)
            }
        }
    }
    
    func addExercisesSamples() {
        
        let samples = ExerciseModel.samples
        Task { @MainActor in
            samples.forEach { example in
                modelContainer.mainContext.insert(example)
            }
        }
    }
    
    func addWorkoutSamples() {
        
        let samples = WorkoutModel.samples
        Task { @MainActor in
            samples.forEach { example in
                modelContainer.mainContext.insert(example)
            }
        }
    }
    
    func addRoutineSamples() {
        
        let samples = RoutineModel.samples
        Task { @MainActor in
            samples.forEach { example in
                modelContainer.mainContext.insert(example)
            }
        }
    }
}
