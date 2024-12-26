//
//  ExerciseView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import SwiftUI

struct ExerciseView: View {
    
    @State var viewModel: ExerciseViewProtocol
    
    init() {
        self.viewModel = ExerciseMockViewModel()
    }
    
    var body: some View {
        Form {
            Section {
                //TODO: Colocar midia
                
                VStack {
                    Text(viewModel.exercise.info)
                }
            }
            
            Section {
                
                switch viewModel.exercise.type {
                case .calisthenics:
                    calisthenicsView
                case .cardio:
                    calisthenicsView
                case .gym:
                    calisthenicsView
                case .warmup:
                    calisthenicsView
                }
            }
        }
        .navigationTitle(viewModel.exercise.name)
    }
    
    @ViewBuilder
    var calisthenicsView: some View {
        HStack {
            Text("Séries:")
            Spacer()
            if let lastLoad = viewModel.exercise.lastLoad {
                Text("\(lastLoad.sets ?? -1)")
            }
        }
        
        HStack {
            Text("Repetições:")
            Spacer()
            if let lastLoad = viewModel.exercise.lastLoad {
                Text("\(lastLoad.reps ?? "ERROR")")
            }
        }
    }
}

#Preview {
    ExerciseView()
}
