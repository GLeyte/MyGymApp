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
                InitialWorkoutView(routineDataManager: RoutineDataProvider(context: modelContext))
                    .navigationTitle("Treinos")
            }
            .environment(stackPathWorkout)
            .tabItem {
                Label("Treinos", systemImage: "figure.strengthtraining.traditional")
            }
            
            NavigationStack(path: $stackPathWorkout.path) {
                Text("")
                    .navigationTitle("Exercícios")
            }
            .environment(stackPathWorkout)
            .tabItem {
                Label("Exercícios", systemImage: "figure.strengthtraining.traditional")
            }
        }
    }
}
