//
//  CalendarView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 18/02/25.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding private var date: Date
    @State private var viewModel: CalendarViewModel
    
    init(date: Binding<Date>, routineDataManager: RoutineDataProvidable) {
        
        self._date = date
        viewModel = CalendarViewModel(date: date.wrappedValue, routineDataManager: routineDataManager)
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            HStack(spacing: 32) {
                
                Button {
                    viewModel.downMonth()
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.primary)
                }
                
                Text(viewModel.date.formatted(.dateTime.year().month(.wide)))
                    .font(.title2)
                    .frame(minWidth: 200)
                
                Button {
                    viewModel.upMonth()
                } label: {
                    Image(systemName: "chevron.right")
                        .tint(.primary)
                }
            }
            VStack {
                
                HStack {
                    ForEach(viewModel.daysOfWeek.indices, id: \.self) { index in
                        Text(viewModel.daysOfWeek[index])
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.days, id: \.self) { day in
                        // This `if` remove dates from days of other months
                        if day.monthInt != viewModel.date.monthInt {
                            Text("")
                        } else {
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, minHeight: 30)
                                .background(
                                    Circle()
                                        .foregroundStyle(
                                                        viewModel.colors[day.dayInt] != nil ?
                                                            viewModel.colors[day.dayInt]!.opacity(0.8) :
                                                            (Date.now.startOfDay == day.startOfDay ? Color.red.opacity(0.3) : Color.red.opacity(0.0))
                                                    )
                                )
                        }
                    }
                }
                .padding(.vertical)
                .frame(height: 250)
                .background{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                }
            }
        }
        .onChange(of: viewModel.date) {
            self.date = viewModel.date
        }
    }
    
}

#Preview {
    let preview = Preview()
    preview.addRoutineSamples()
    return CalendarView(date: .constant(.now), routineDataManager: RoutineMockDataProvider())
        .modelContainer(preview.modelContainer)
}
