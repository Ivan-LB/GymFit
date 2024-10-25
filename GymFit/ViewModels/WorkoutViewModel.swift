//
//  WorkoutViewModel.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workoutDays: [WorkoutDay] = [
        WorkoutDay(dayOfWeek: "Lunes", exercises: [
            Exercise(name: "Curl de Bíceps", sets: 3, repetitions: 12, maxWeight: 20.0),
            Exercise(name: "Press de Hombros", sets: 3, repetitions: 10, maxWeight: 30.0)
        ]),
        WorkoutDay(dayOfWeek: "Martes", exercises: [
            Exercise(name: "Sentadillas", sets: 4, repetitions: 10, maxWeight: 50.0)
        ]),
        // Añade más días si lo necesitas
    ]
}
