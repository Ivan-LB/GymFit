//
//  WorkoutsView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct WorkoutsView: View {
    @StateObject private var viewModel = WorkoutViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.workoutDays) { day in
                    NavigationLink(destination: WorkoutDetailView(day: day)) {
                        Text(day.dayOfWeek)
                            .font(.headline)
                            .padding()
                    }
                }
            }
            .navigationTitle("Rutinas Semanales")
        }
    }
}

#Preview {
    WorkoutsView()
}
