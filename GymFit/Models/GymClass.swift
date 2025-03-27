//
//  GymClass.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import Foundation

// Modelo para clases
struct GymClass: Identifiable {
    var id = UUID()
    var name: String
    var instructor: String
    var time: String
    var dayIndex: Int
}
