//
//  Workout.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import Foundation

// Modelo de datos para ejercicios
struct Workout: Identifiable {
    var id = UUID()
    var name: String
    var sets: Int
    var reps: Int
    var weight: Double
    var date: Date
}
