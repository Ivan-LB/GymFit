//
//  WorkoutRow.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

// Fila para cada ejercicio
struct WorkoutRow: View {
    var workout: Workout
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(workout.name)
                    .font(.headline)
                Text("\(workout.sets) series × \(workout.reps) reps")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("\(Int(workout.weight)) kg")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
        }
        .padding(.vertical, 8)
    }
}
