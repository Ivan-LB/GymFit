//
//  AppSettingsView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct AppSettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("language") private var language = "es"
    @State private var showDeleteConfirmation = false
    
    let languages = [
        ("es", "Español"),
        ("en", "English")
    ]
    
    var body: some View {
        Form {
            Section(header: Text("Apariencia")) {
                Toggle("Modo Oscuro", isOn: $isDarkMode)
                    .tint(Color("PrimaryYellow"))
            }
            
            Section(header: Text("Idioma")) {
                Picker("Idioma de la Aplicación", selection: $language) {
                    ForEach(languages, id: \.0) { code, name in
                        Text(name).tag(code)
                    }
                }
            }
            
            Section(header: Text("Privacidad")) {
                NavigationLink(destination: Text("Política de Privacidad")) {
                    Text("Política de Privacidad")
                }
                
                NavigationLink(destination: Text("Términos y Condiciones")) {
                    Text("Términos y Condiciones")
                }
            }
            
            Section(header: Text("Datos")) {
                Button(action: {
                    // Acción para exportar datos
                }) {
                    Text("Exportar Mis Datos")
                }
                
                Button(action: {
                    showDeleteConfirmation = true
                }) {
                    Text("Eliminar Mi Cuenta")
                        .foregroundColor(.red)
                }
                .alert(isPresented: $showDeleteConfirmation) {
                    Alert(
                        title: Text("¿Eliminar cuenta?"),
                        message: Text("Esta acción no se puede deshacer. Todos tus datos serán eliminados permanentemente."),
                        primaryButton: .destructive(Text("Eliminar")) {
                            // Acción para eliminar cuenta
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            
            Section(header: Text("Acerca de")) {
                HStack {
                    Text("Versión")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.secondary)
                }
                
                Button(action: {
                    // Acción para calificar la app
                }) {
                    Text("Calificar la App")
                }
                
                Button(action: {
                    // Acción para enviar comentarios
                }) {
                    Text("Enviar Comentarios")
                }
            }
        }
        .navigationTitle("Ajustes")
    }
}
