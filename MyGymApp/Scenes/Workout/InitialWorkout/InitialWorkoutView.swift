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
    let diameter = UIScreen.main.bounds.width/6
    @State private var viewModel: InitialWorkoutViewModel
    
    init(workoutDataManager: WorkoutDataProvidable) {
        self.viewModel = InitialWorkoutViewModel(workoutDataManager: workoutDataManager)
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            calendar
            
            HStack {
                
                circularProgress(done: 3, total: 7)
                
                Spacer()
                
                circularProgress(done: 18, total: 30)
                
                Spacer()
                
                circularProgress(done: 40, total: 365)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
    
    @ViewBuilder
    var calendar : some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 8))
            .opacity(0.25)
    }
    
    @ViewBuilder
    func circularProgress(done: Int, total: Int) -> some View {
        
        let progress: Double = Double(done) / Double(total)
        
        VStack(spacing: 16) {
            
            if total == 7 {
                Text("Semana")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
            } else if total > 300 {
                Text("Ano")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
            } else {
                Text("Mês")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
            }
                
            
            CircularProgressView(progress: progress)
                .frame(width: diameter, height: diameter)
            
            Text("\(done) / \(total)")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
        }
    }
}


#Preview {
    
    let preview = Preview()
    preview.addWorkoutSamples()
    return InitialWorkoutView(workoutDataManager: WorkoutMockDataProvider())
            .modelContainer(preview.modelContainer)
            .environment(Router())
}
