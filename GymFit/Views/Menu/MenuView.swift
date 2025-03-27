//
//  MenuView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Mi Cuenta")) {
                    NavigationLink(destination: ProfileView()) {
                        MenuRow(icon: "person.fill", title: "Perfil")
                    }
                    
                    NavigationLink(destination: MembershipView()) {
                        MenuRow(icon: "creditcard.fill", title: "Membresía")
                    }
                }
                
                Section(header: Text("Servicios")) {
                    NavigationLink(destination: CustomerServiceView()) {
                        MenuRow(icon: "megaphone.fill", title: "Atención al Cliente")
                    }
                    
                    NavigationLink(destination: SocialMediaView()) {
                        MenuRow(icon: "network", title: "Redes Sociales")
                    }
                }
                
                Section(header: Text("Configuración")) {
                    NavigationLink(destination: NotificationsSettingsView()) {
                        MenuRow(icon: "bell.fill", title: "Notificaciones")
                    }
                    
                    NavigationLink(destination: AppSettingsView()) {
                        MenuRow(icon: "gearshape.fill", title: "Ajustes")
                    }
                }
                
                Section {
                    Button(action: {
                        // Lógica para cerrar sesión
                    }) {
                        Text("Cerrar Sesión")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Menú")
        }
    }
}

#Preview {
    MenuView()
}
