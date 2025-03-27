//
//  MembershipView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct MembershipView: View {
    @State private var membershipType = "Premium"
    @State private var startDate = Date(timeIntervalSinceNow: -60*60*24*90) // 90 días atrás
    @State private var endDate = Date(timeIntervalSinceNow: 60*60*24*275) // 275 días adelante
    @State private var showRenewalOptions = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Tarjeta de membresía
                VStack(spacing: 15) {
                    Text("Membresía Activa")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(membershipType)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Miembro desde")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Text(formattedDate(startDate))
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("Válido hasta")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Text(formattedDate(endDate))
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Barra de progreso
                    MembershipProgressBar(startDate: startDate, endDate: endDate)
                }
                .padding(20)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black, Color("PrimaryYellow")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(16)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                // Beneficios
                VStack(alignment: .leading) {
                    Text("Beneficios Incluidos")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        BenefitRow(icon: "dumbbell.fill", title: "Acceso a todas las áreas", isIncluded: true)
                        BenefitRow(icon: "person.2.fill", title: "Clases grupales ilimitadas", isIncluded: true)
                        BenefitRow(icon: "figure.walk", title: "Evaluación física mensual", isIncluded: true)
                        BenefitRow(icon: "shower.fill", title: "Acceso a vestidores premium", isIncluded: membershipType == "Premium")
                        BenefitRow(icon: "parkingsign", title: "Estacionamiento gratuito", isIncluded: membershipType == "Premium")
                    }
                    .padding(.horizontal)
                }
                
                // Historial de pagos
                VStack(alignment: .leading) {
                    Text("Historial de Pagos")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        PaymentHistoryRow(date: "15 Ago 2024", amount: "$1,200.00", status: "Pagado")
                        PaymentHistoryRow(date: "15 Jul 2024", amount: "$1,200.00", status: "Pagado")
                        PaymentHistoryRow(date: "15 Jun 2024", amount: "$1,200.00", status: "Pagado")
                    }
                    .padding(.horizontal)
                }
                
                // Botón de renovación
                Button(action: {
                    showRenewalOptions = true
                }) {
                    Text("Renovar Membresía")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("PrimaryYellow"))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .sheet(isPresented: $showRenewalOptions) {
                    RenewalOptionsView()
                }
            }
            .padding(.vertical, 20)
        }
        .navigationTitle("Mi Membresía")
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
