//
//  ExerciseViewProtocol.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import Foundation

protocol ExerciseViewProtocol {
    
    var exercise: Exercise { get set }
    var load: Load { get set }
    var edit: Bool { get set }
    func updateLoad()
}
