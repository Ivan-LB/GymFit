//
//  RenewalOptionsView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

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
