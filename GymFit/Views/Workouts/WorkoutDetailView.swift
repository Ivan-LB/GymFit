//
//  WorkoutDetailView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    @State var day: WorkoutDay

    var body: some View {
        VStack {
            Text("Rutina de \(day.dayOfWeek)")
                .font(.largeTitle)
                .padding()

            List {
                ForEach(day.exercises) { exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                        HStack {
                            Text(exercise.name)
                            Spacer()
                            Text("\(exercise.sets) sets de \(exercise.repetitions) reps")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutDetailView(day: WorkoutDay(dayOfWeek: "Lunes", exercises: [Exercise(name: "Curl de Bíceps", sets: 3, repetitions: 12, maxWeight: 20)]))
}

