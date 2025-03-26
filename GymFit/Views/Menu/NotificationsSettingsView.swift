//
//  NotificationsSettingsView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct NotificationsSettingsView: View {
    @State private var pushNotificationsEnabled = true
    @State private var emailNotificationsEnabled = true
    @State private var classRemindersEnabled = true
    @State private var paymentRemindersEnabled = true
    @State private var promotionsEnabled = false
    @State private var newsEnabled = false
    @State private var reminderTime = 60 // minutos antes
    
    var body: some View {
        Form {
            Section(header: Text("Canales de Notificación")) {
                Toggle("Notificaciones Push", isOn: $pushNotificationsEnabled)
                    .tint(Color("PrimaryYellow"))
                
                Toggle("Notificaciones por Email", isOn: $emailNotificationsEnabled)
                    .tint(Color("PrimaryYellow"))
            }
            
            Section(header: Text("Tipos de Notificación")) {
                Toggle("Recordatorios de Clases", isOn: $classRemindersEnabled)
                    .tint(Color("PrimaryYellow"))
                
                if classRemindersEnabled {
                    Picker("Recordar", selection: $reminderTime) {
                        Text("15 minutos antes").tag(15)
                        Text("30 minutos antes").tag(30)
                        Text("1 hora antes").tag(60)
                        Text("2 horas antes").tag(120)
                    }
                }
                
                Toggle("Recordatorios de Pago", isOn: $paymentRemindersEnabled)
                    .tint(Color("PrimaryYellow"))
                
                Toggle("Promociones y Ofertas", isOn: $promotionsEnabled)
                    .tint(Color("PrimaryYellow"))
                
                Toggle("Noticias y Eventos", isOn: $newsEnabled)
                    .tint(Color("PrimaryYellow"))
            }
            
            Section(footer: Text("Puedes cambiar estas preferencias en cualquier momento.")) {
                Button(action: {
                    // Acción para restablecer a valores predeterminados
                }) {
                    Text("Restablecer a Valores Predeterminados")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Notificaciones")
    }
}
