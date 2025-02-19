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
    let diameter = UIScreen.main.bounds.width/8
    @State private var selectedDate: Date = .now
    @State private var viewModel: InitialWorkoutViewModel
    
    init(routineDataManager: RoutineDataProvidable) {
        self.viewModel = InitialWorkoutViewModel(routineDataManager: routineDataManager)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 24) {
                
                CalendarView(date: $selectedDate, routineDataManager: RoutineDataProvider(context: modelContext))
                                
                HStack {
                    
                    circularProgress(done: 3, total: 7)
                    
                    Spacer()
                    
                    circularProgress(done: 18, total: selectedDate.numberOfDaysInMonth)
                    
                    Spacer()
                    
                    circularProgress(done: 40, total: selectedDate.numberOfDaysInYear)
                }
                .padding(.horizontal)
                
                Button {
                    stackPathTransaction.goTo(view: RouterValue(view: .Workouts))
                } label: {
                    HStack {
                        Image(systemName: "dumbbell")
                        Text("Começar Treino")
                        Image(systemName: "dumbbell")
                    }
                    .foregroundStyle(.black)
                    .font(.title3.bold())
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .tint(.accent)
                    }
                }
                
                Text("Histórico")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .padding(.bottom, -8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVStack(alignment: .leading, spacing: 0) {
                    Section {
                        ForEach(viewModel.routines) { routine in
                            RoutineCellView(routine: routine)
                            
                            // Add a divider after each item except the last one
                            if routine != viewModel.routines.last {
                                Divider()
                                    .padding(.vertical, 8) // Add padding around the divider
                            }
                        }
                    }
                }
                .padding(16)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color(.secondarySystemBackground))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    stackPathTransaction.goTo(view: RouterValue(view: .Workouts))
                }) {
                    Text("Treinar")
                        .font(.headline)
                        .foregroundStyle(.accent)
                }
            }
        }
        .navigationDestination(for: RouterValue.self) { value in
            WorkoutNavigationDetinationView(value: value)
        }
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
    return InitialWorkoutView(routineDataManager: RoutineMockDataProvider())
        .modelContainer(preview.modelContainer)
        .environment(Router())
}
