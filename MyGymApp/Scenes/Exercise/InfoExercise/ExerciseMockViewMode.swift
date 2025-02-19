//
//  ExerciseMockViewModel.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation

@Observable
class ExerciseMockViewModel: ExerciseViewProtocol {
    
    var exerciseDataManager = ExerciseMockDataProvider()
    var exercise: Exercise
    var load: Load
    var edit: Bool = false
    
    init(exerciseDataManager: ExerciseMockDataProvider = ExerciseMockDataProvider()) {
        self.exerciseDataManager = exerciseDataManager
        self.exercise = try! exerciseDataManager.getItems().first!
        self.load = try! exerciseDataManager.getItems().first!.lastLoad!
    }
    
    func updateLoad() {
        
    }
    
}
