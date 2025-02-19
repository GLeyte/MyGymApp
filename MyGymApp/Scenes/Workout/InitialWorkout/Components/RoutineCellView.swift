//
//  RoutineCellView.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 19/02/25.
//

import SwiftUI

struct RoutineCellView: View {
    
    let routine: Routine
    
    var body: some View {
        HStack {
            Image(systemName: routine.workout.type.getSymbol())
                .frame(width: 32)
            Text(routine.workout.name)
            Spacer()
            Text(routine.date.formatted(.dateTime.day().month()))
        }
    }
}

//#Preview {
//    RoutineCellView()
//}
