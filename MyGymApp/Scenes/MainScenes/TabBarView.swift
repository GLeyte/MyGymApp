//
//  TabBarView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import SwiftUI

struct TabBarView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var stackPathWorkout = Router()
    @State private var stackPathExercises = Router()
    
    var body: some View {
        TabView {
            
            NavigationStack(path: $stackPathWorkout.path) {
                InitialWorkoutView(workoutDataManager: WorkoutDataProvider(context: modelContext))
                    .navigationTitle(String(localized:"Treinos"))
            }
            .environment(stackPathWorkout)
            .tabItem {
                Label(String(localized:"Treinos"), systemImage: "figure.strengthtraining.traditional")
            }
        }
    }
}

#Preview {
    TabBarView()
}
