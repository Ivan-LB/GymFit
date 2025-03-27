//
//  CustomerServiceView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct CustomerServiceView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Encabezado
                Text("Atención al Cliente")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Tarjeta de horario
                ServiceInfoCard(
                    title: "Horario de Atención",
                    icon: "clock.fill",
                    content: "9:00 am - 1:00 pm",
                    subtitle: "Tercer miércoles de cada mes"
                )
                
                // Tarjeta de contacto
                ServiceInfoCard(
                    title: "Contacto",
                    icon: "phone.fill",
                    content: "+52 123 456 7890",
                    subtitle: "contacto@gymfit.com"
                )
                
                // Botón de cancelación
                Button(action: {
                    if let url = URL(string: "https://gymfit.com/cancelacion") {
                        openURL(url)
                    }
                }) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20))
                        Text("Solicitar Cancelación")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // FAQ
                VStack(alignment: .leading, spacing: 15) {
                    Text("Preguntas Frecuentes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    FAQItem(question: "¿Cómo puedo congelar mi membresía?", answer: "Puedes solicitar congelar tu membresía por hasta 30 días al año. Contacta a atención al cliente durante el horario establecido.")
                    
                    FAQItem(question: "¿Cuál es la política de reembolso?", answer: "Ofrecemos reembolso completo dentro de los primeros 7 días de tu membresía si no estás satisfecho con nuestro servicio.")
                    
                    FAQItem(question: "¿Puedo transferir mi membresía?", answer: "Las membresías son personales e intransferibles según nuestros términos y condiciones.")
                }
                .padding(.top)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    CustomerServiceView()
}
