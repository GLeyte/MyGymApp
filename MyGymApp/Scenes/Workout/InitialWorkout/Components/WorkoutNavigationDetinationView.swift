//
//  InitialWorkoutNavigationDetinationView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 19/02/25.
//

import SwiftUI

struct WorkoutNavigationDetinationView: View {
    
    let value: RouterValue
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        switch value.view {
        default:
            Text("")
        }
    }
}
