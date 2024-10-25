//
//  ExerciseDetailView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    @State var exercise: Exercise
    @State private var newMaxWeight: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text(exercise.name)
                .font(.largeTitle)
                .padding()

            Text("\(exercise.sets) sets de \(exercise.repetitions) repeticiones")
                .font(.headline)

            HStack {
                Text("Peso Máximo Actual: ")
                Text("\(exercise.maxWeight, specifier: "%.2f") kg")
            }

            TextField("Nuevo Peso Máximo", text: $newMaxWeight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                if let weight = Double(newMaxWeight) {
                    exercise.maxWeight = weight
                    newMaxWeight = ""
                }
            }) {
                Text("Actualizar Peso Máximo")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(exercise.name)
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise(name: "Curl de Bíceps", sets: 3, repetitions: 12, maxWeight: 20.0))
}
