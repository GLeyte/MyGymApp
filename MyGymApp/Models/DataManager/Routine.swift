//
//  Routine.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Routine: Identifiable, Equatable, Hashable {
    var id: String
    var date: Date
    var workout: Workout
}
