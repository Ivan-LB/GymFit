//
//  CustomerServiceView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct CustomerServiceView: View {
    private let cancelationLink: URL = ConfigurationManager.shared.cancelMembership
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image("logofit2020")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 250)
            Text("Atención al Cliente")
                .font(.title)
            Text("En FIT te queremos escuchar, si tienes alguna queja, sugerencia o comentario puedes hacernoslo llegar por correo electrónico.")
            Text("Teléfono: +52 664 900 0014")
            Text("Correo: soyfit@fitmexico.com")
            
            // Sección de Link de Cancelación
            VStack(alignment: .leading, spacing: 10) {
                Text("Link de Cancelación")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)  // Puedes cambiar el color si lo prefieres
                
                Text("Horario de atención: 9:00 am a 1:00 pm")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Tercer miércoles de cada mes")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Botón para redirigir al enlace
                Button(action: {
                    openURL(cancelationLink)
                }) {
                    Text("Ir al Link de Cancelación")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Atención al Cliente")
    }
    // Función para abrir el URL
    func openURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    CustomerServiceView()
}
