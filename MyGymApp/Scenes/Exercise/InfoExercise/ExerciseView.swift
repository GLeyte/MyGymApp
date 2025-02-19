//
//  ExerciseView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 26/12/24.
//

import SwiftUI
import SwiftData

struct ExerciseView: View {
    
    @State var viewModel: ExerciseViewProtocol
    
    init() {
        self.viewModel = ExerciseMockViewModel()
    }
    
    var body: some View {
        Form {
            Section {
                
                //TODO: Colocar midia
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: .infinity, height: 150)
                    .overlay {
                        Text("Video")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                
                VStack(spacing:16) {
                    
                    HStack {
                        Text("Músculo focal:")
                        Spacer()
                        Text(viewModel.exercise.muscle.rawValue)
                            .bold()
                    }
                    
                    if viewModel.exercise.info != "" {
                        Text(viewModel.exercise.info)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
            }
            
            Section {
                
                if let sets = viewModel.exercise.lastLoad?.sets {
                    HStack {
                        Text("Séries:")
                        Spacer()
                        Text("\(sets)")
                    }
                }
                
                if viewModel.load.reps != nil {

                    RowStringView(
                        editing: $viewModel.edit,
                        textInfo: "Repetições:",
                        text: Binding(
                            get: { viewModel.load.reps ?? "" },
                            set: { viewModel.load.reps = $0 }
                        )
                    )
                }
                
                if let weight = viewModel.exercise.lastLoad?.weight {
                    HStack {
                        Text("Carga:")
                        Spacer()
                        Text("\(weight)")
                    }
                }
                
                if let distance = viewModel.exercise.lastLoad?.distance {
                    HStack {
                        Text("Distância:")
                        Spacer()
                        Text("\(distance) Km")
                    }
                }
                
                if let duration = viewModel.exercise.lastLoad?.duration, let timeType = viewModel.exercise.lastLoad?.timeType {
                    HStack {
                        Text("Duração:")
                        Spacer()
                        Text("\(duration) \(timeType)")
                    }
                }
            } header: {
                Text("Desempenho atual")
            }
            
        }
        .navigationTitle(viewModel.exercise.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if viewModel.edit {
                        viewModel.updateLoad()
                        viewModel.edit = false
                    } else {
                        viewModel.edit = true
                    }
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    
    let preview = Preview()
    preview.addExercisesSamples()
    return ExerciseView()
        .modelContainer(preview.modelContainer)
    
}
