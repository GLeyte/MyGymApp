//
//  CalendarViewModel.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 18/02/25.
//

import Foundation
import SwiftUI

@Observable
class CalendarViewModel {
    
    private var routineDataManager: RoutineDataProvidable
    var routines: [Routine] = []
    
    var startOfMonth: Date
    var endOfMonthAdjustment: Date
    var date: Date
    
    let daysOfWeek: [String] = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var colors: [Int: Color] = [:]
    var days: [Date] = []
    
    init(date:Date, routineDataManager: RoutineDataProvidable) {
        self.days = date.calendarDisplayDays
        self.routineDataManager = routineDataManager
        self.date = date
        self.startOfMonth = date.startOfMonth
        self.endOfMonthAdjustment = Calendar.current.date(byAdding: .day, value: 1, to: date.endOfMonth)!
        fetchData()
        setupColor()
    }
    
    private func fetchData() {
        do {
            try routines = routineDataManager.getItems()
                .filter{ $0.date >= startOfMonth && $0.date < endOfMonthAdjustment }
                .sorted { $0.date < $1.date }
        } catch {
            print(error)
        }
    }
    
    private func updateDates() {
        days = date.calendarDisplayDays
        startOfMonth = date.startOfMonth
        endOfMonthAdjustment = Calendar.current.date(byAdding: .day, value: 1, to: date.endOfMonth)!
    }
    
    func downMonth() {
        withTransaction(Transaction(animation: nil)) {
            date = Calendar.current.date(byAdding: .month, value: -1, to: date)!
            updateDates()
            fetchData()
            setupColor()
        }
    }
    
    func upMonth() {
        withTransaction(Transaction(animation: nil)) {
            date = Calendar.current.date(byAdding: .month, value: 1, to: date)!
            updateDates()
            fetchData()
            setupColor()
        }
    }
    
    func setupColor() {
        
        colors.removeAll()
        
        for routine in routines {
            let day = routine.date.dayInt
            colors[day] = routine.workout.type.getColor()
        }
        
    }
}
