//
//  WorkoutDetailView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct WorkoutDetailView: View {
    var workout: Workout
    @State private var currentWeight: Double
    @State private var currentReps: Int
    @State private var currentSets: Int
    @State private var notes: String = ""
    
    init(workout: Workout) {
        self.workout = workout
        _currentWeight = State(initialValue: workout.weight)
        _currentReps = State(initialValue: workout.reps)
        _currentSets = State(initialValue: workout.sets)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Encabezado
                Text(workout.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Progreso
                ProgressSection(workout: workout)
                
                // Ajustes actuales
                Group {
                    // Peso
                    VStack(alignment: .leading) {
                        Text("Peso (kg)")
                            .font(.headline)
                        
                        HStack {
                            Slider(value: $currentWeight, in: 0...200, step: 2.5)
                                .accentColor(.yellow)
                            
                            Text("\(Int(currentWeight))")
                                .font(.headline)
                                .frame(width: 50)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Repeticiones
                    VStack(alignment: .leading) {
                        Text("Repeticiones")
                            .font(.headline)
                        
                        Stepper("\(currentReps) reps", value: $currentReps, in: 1...30)
                    }
                    .padding(.horizontal)
                    
                    // Series
                    VStack(alignment: .leading) {
                        Text("Series")
                            .font(.headline)
                        
                        Stepper("\(currentSets) series", value: $currentSets, in: 1...10)
                    }
                    .padding(.horizontal)
                }
                
                // Notas
                VStack(alignment: .leading) {
                    Text("Notas")
                        .font(.headline)
                    
                    TextEditor(text: $notes)
                        .frame(height: 100)
                        .padding(4)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
                }
                .padding(.horizontal)
                
                // Botón guardar
                Button(action: {
                    // Guardar cambios
                }) {
                    Text("Guardar Progreso")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding()
            }
            .padding(.vertical)
        }
        .navigationTitle("Detalle de Ejercicio")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProgressSection: View {
    var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tu Progreso")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    // Aquí se mostrarían los datos históricos
                    ForEach(0..<5) { i in
                        VStack {
                            Text("\(Int(workout.weight - Double(i * 2))) kg")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("\(workout.reps - i) reps")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text("Hace \(i+1) días")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(width: 100, height: 100)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
