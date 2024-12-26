//
//  InitialWorkoutViewModel.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import SwiftData
import SwiftUI

@Observable
final class InitialWorkoutViewModel {
    
    private var workoutDataManager: WorkoutDataProvidable
    
    var workouts: [Workout] = []
    
    init(workoutDataManager: WorkoutDataProvidable) {
        self.workoutDataManager = workoutDataManager
        fetchWorkouts()
    }
    
    private func fetchWorkouts() {
        do {
            try workouts = workoutDataManager.getItems()
        } catch {
            print(error)
        }
    }
}
