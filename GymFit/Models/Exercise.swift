//
//  Exercise.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import Foundation

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let sets: Int
    let repetitions: Int
    var maxWeight: Double
}
