//
//  ProfileView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var name = "Ivan Lorenzana"
    @State private var email = "ivan@example.com"
    @State private var phone = "123-456-7890"
    @State private var birthdate = Date(timeIntervalSince1970: 800000000) // Fecha de ejemplo
    @State private var isEditMode = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Foto de perfil
                ZStack(alignment: .bottomTrailing) {
                    Image("profile_placeholder") // Reemplazar con imagen real
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("PrimaryYellow"), lineWidth: 3))
                        .shadow(radius: 3)
                    
                    if isEditMode {
                        Button(action: {
                            // Acción para cambiar foto
                        }) {
                            Circle()
                                .fill(Color("PrimaryYellow"))
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Image(systemName: "camera.fill")
                                        .foregroundColor(.black)
                                )
                        }
                        .offset(x: 5, y: 5)
                    }
                }
                .padding(.top, 20)
                
                // Información del perfil
                VStack(spacing: 20) {
                    ProfileInfoSection(
                        title: "Información Personal",
                        isEditMode: $isEditMode,
                        fields: [
                            ProfileField(label: "Nombre", value: $name, icon: "person.fill"),
                            ProfileField(label: "Email", value: $email, icon: "envelope.fill"),
                            ProfileField(label: "Teléfono", value: $phone, icon: "phone.fill")
                        ]
                    )
                    
                    // Fecha de nacimiento con DatePicker
                    VStack(alignment: .leading) {
                        Text("Fecha de Nacimiento")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color("PrimaryYellow"))
                                .frame(width: 30)
                            
                            if isEditMode {
                                DatePicker("", selection: $birthdate, displayedComponents: .date)
                                    .labelsHidden()
                            } else {
                                Text(formattedDate(birthdate))
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    
                    // Estadísticas
                    VStack(alignment: .leading) {
                        Text("Estadísticas")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack(spacing: 15) {
                            StatCard(title: "Visitas", value: "42", icon: "figure.walk")
                            StatCard(title: "Clases", value: "12", icon: "person.2.fill")
                            StatCard(title: "Rutinas", value: "8", icon: "dumbbell.fill")
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 30)
        }
        .navigationTitle("Mi Perfil")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation {
                        if isEditMode {
                            // Aquí iría la lógica para guardar cambios
                        }
                        isEditMode.toggle()
                    }
                }) {
                    Text(isEditMode ? "Guardar" : "Editar")
                        .foregroundColor(Color("PrimaryYellow"))
                }
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
