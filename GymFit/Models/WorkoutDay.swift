//
//  WorkoutDay.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import Foundation

struct WorkoutDay: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    var exercises: [Exercise]
}
