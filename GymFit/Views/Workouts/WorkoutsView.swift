//
//  WorkoutsView 2.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct WorkoutsView: View {
    @State private var selectedDate = Date()
    @State private var workouts: [Workout] = []
    
    let sampleWorkouts: [Workout] = [
        Workout(name: "Press de Banca", sets: 4, reps: 10, weight: 80, date: Date()),
        Workout(name: "Sentadillas", sets: 4, reps: 12, weight: 100, date: Date()),
        Workout(name: "Dominadas", sets: 3, reps: 8, weight: 0, date: Date()),
        Workout(name: "Curl de Bíceps", sets: 3, reps: 12, weight: 15, date: Date())
    ]
    
    init() {
        _workouts = State(initialValue: sampleWorkouts) // Inicialización dentro del init
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Selector de fecha
                DatePicker("Selecciona fecha", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                // Lista de ejercicios
                List {
                    ForEach(workoutsForSelectedDate) { workout in
                        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                            WorkoutRow(workout: workout)
                        }
                    }
                    .onDelete(perform: deleteWorkout)
                }
                
                // Botón para agregar ejercicio
                Button(action: {
                    // Mostrar modal para agregar ejercicio
                }) {
                    Label("Agregar Ejercicio", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("Mis Rutinas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Mostrar historial
                    }) {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                    }
                }
            }
        }
    }
    
    // Filtrar ejercicios por fecha seleccionada
    var workoutsForSelectedDate: [Workout] {
        workouts.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }
    }
    
    // Eliminar ejercicio
    func deleteWorkout(at offsets: IndexSet) {
        // Implementar lógica para eliminar
    }
}
