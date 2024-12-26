//
//  InitialWorkoutView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import SwiftUI
import SwiftData

struct InitialWorkoutView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(Router.self) var stackPathTransaction : Router
    @State private var viewModel: InitialWorkoutViewModel
    
    init(workoutDataManager: WorkoutDataProvidable) {
        self.viewModel = InitialWorkoutViewModel(workoutDataManager: workoutDataManager)
    }
    
    var body: some View {
        ZStack {
            if viewModel.workouts.isEmpty {
                Text("No workouts")
            } else {
                List {
                    ForEach(viewModel.workouts) { workout in
                        Text(workout.name)
                    }
                }
            }
        }
    }
}

#Preview {
    InitialWorkoutView(workoutDataManager: WorkoutMockDataProvider())
        .environment(Router())
}
