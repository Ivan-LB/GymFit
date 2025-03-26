//
//  SchedulesView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct SchedulesView: View {
    @State private var showFullScreenImage = false
    @State private var selectedDay = 0
    
    let days = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    let sampleClasses: [GymClass] = [
        GymClass(name: "Yoga", instructor: "Ana Pérez", time: "7:00 AM", dayIndex: 0),
        GymClass(name: "HIIT", instructor: "Carlos Gómez", time: "9:00 AM", dayIndex: 0),
        GymClass(name: "CrossFit", instructor: "Luis Fernández", time: "6:00 PM", dayIndex: 1),
        GymClass(name: "Spinning", instructor: "Laura Torres", time: "8:00 AM", dayIndex: 2),
        GymClass(name: "Pilates", instructor: "Sofía Rojas", time: "5:00 PM", dayIndex: 3),
        GymClass(name: "Zumba", instructor: "José Martínez", time: "6:30 PM", dayIndex: 4)
    ]

    
    var body: some View {
        NavigationView {
            VStack {
                // Selector de días
                Picker("Día", selection: $selectedDay) {
                    ForEach(0..<days.count, id: \.self) { index in
                        Text(days[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                ScrollView {
                    VStack(spacing: 15) {
                        // Horario del día como imagen (tappable)
                        Button(action: {
                            showFullScreenImage = true
                        }) {
                            Image("schedule_placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                )
                                .padding(.horizontal)
                        }
                        
                        // Lista de clases del día
                        ForEach(classesForSelectedDay) { gymClass in
                            ClassCard(gymClass: gymClass)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("Horarios")
            .fullScreenCover(isPresented: $showFullScreenImage) {
                FullScreenImageView(image: "schedule_placeholder")
            }
        }
    }
    
    // Clases filtradas por día seleccionado
    var classesForSelectedDay: [GymClass] {
        sampleClasses.filter { $0.dayIndex == selectedDay }
    }
}

// Modelo para clases
struct GymClass: Identifiable {
    var id = UUID()
    var name: String
    var instructor: String
    var time: String
    var dayIndex: Int
}

// Tarjeta para cada clase
struct ClassCard: View {
    var gymClass: GymClass
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(gymClass.name)
                    .font(.headline)
                Text(gymClass.instructor)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(gymClass.time)
                .font(.system(.headline, design: .monospaced))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.yellow.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(8)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// Vista de imagen a pantalla completa
struct FullScreenImageView: View {
    @Environment(\.presentationMode) var presentationMode
    var image: String
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
            }
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height > 100 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )
    }
}

#Preview {
    SchedulesView()
}
