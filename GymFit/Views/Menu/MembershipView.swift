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

struct MembershipProgressBar: View {
    var startDate: Date
    var endDate: Date
    
    var progress: CGFloat {
        let total = endDate.timeIntervalSince(startDate)
        let elapsed = Date().timeIntervalSince(startDate)
        return min(max(CGFloat(elapsed / total), 0), 1)
    }
    
    var daysRemaining: Int {
        let remaining = endDate.timeIntervalSince(Date())
        return max(Int(remaining / (60*60*24)), 0)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width * progress, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
            
            HStack {
                Text("\(daysRemaining) días restantes")
                    .font(.caption)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("\(Int(progress * 100))% completado")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
    }
}

struct BenefitRow: View {
    var icon: String
    var title: String
    var isIncluded: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isIncluded ? Color("PrimaryYellow") : .gray)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(isIncluded ? .primary : .gray)
            
            Spacer()
            
            Image(systemName: isIncluded ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(isIncluded ? .green : .gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct PaymentHistoryRow: View {
    var date: String
    var amount: String
    var status: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(date)
                    .font(.subheadline)
                
                Text(status)
                    .font(.caption)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Text(amount)
                .font(.headline)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct RenewalOptionsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Selecciona un Plan")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    // Planes
                    MembershipPlanCard(
                        title: "Mensual",
                        price: "$1,500",
                        period: "por mes",
                        features: ["Acceso completo al gimnasio", "Clases grupales", "App de seguimiento"],
                        isRecommended: false
                    )
                    
                    MembershipPlanCard(
                        title: "Semestral",
                        price: "$7,200",
                        period: "por 6 meses",
                        features: ["Acceso completo al gimnasio", "Clases grupales", "App de seguimiento", "1 evaluación física"],
                        isRecommended: true
                    )
                    
                    MembershipPlanCard(
                        title: "Anual",
                        price: "$12,000",
                        period: "por año",
                        features: ["Acceso completo al gimnasio", "Clases grupales", "App de seguimiento", "2 evaluaciones físicas", "1 mes gratis"],
                        isRecommended: false
                    )
                }
                .padding()
            }
            .navigationTitle("Renovar Membresía")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct MembershipPlanCard: View {
    var title: String
    var price: String
    var period: String
    var features: [String]
    var isRecommended: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            if isRecommended {
                Text("Recomendado")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color("PrimaryYellow"))
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .offset(y: -15)
            }
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(alignment: .firstTextBaseline) {
                Text(price)
                    .font(.system(size: 32, weight: .bold))
                
                Text(period)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(features, id: \.self) { feature in
                    HStack(alignment: .top) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 14))
                        
                        Text(feature)
                            .font(.subheadline)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            
            Button(action: {
                // Acción para seleccionar plan
            }) {
                Text("Seleccionar")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isRecommended ? Color("PrimaryYellow") : Color(.systemGray5))
                    .foregroundColor(isRecommended ? .black : .primary)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isRecommended ? Color("PrimaryYellow") : Color.gray.opacity(0.3), lineWidth: isRecommended ? 2 : 1)
        )
        .padding(.horizontal)
    }
}
