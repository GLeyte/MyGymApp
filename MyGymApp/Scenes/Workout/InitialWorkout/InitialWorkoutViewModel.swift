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
    
    private var routineDataManager: RoutineDataProvidable
    
    var routines: [Routine] = []
    
    init(routineDataManager: RoutineDataProvidable) {
        self.routineDataManager = routineDataManager
        fetchWorkouts()
    }
    
    private func fetchWorkouts() {
        do {
            let sortedRoutines = try routineDataManager.getItems().sorted { $0.date < $1.date }
            routines = Array(sortedRoutines.prefix(upTo: min(10, sortedRoutines.count)))
        } catch {
            print(error)
        }
    }
}
