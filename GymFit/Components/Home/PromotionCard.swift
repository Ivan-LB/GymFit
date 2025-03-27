//
//  PromotionCard.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct PromotionCard: View {
    var title: String
    var subtitle: String = "Oferta por tiempo limitado"
    var backgroundImage: String = "promotion_placeholder"
    var actionText: String = "Ver más"
    var action: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Imagen de fondo
            Image(backgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(16)
            
            // Overlay con gradiente para mejorar legibilidad
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(16)
            
            // Contenido
            VStack(alignment: .leading, spacing: 8) {
                Text(subtitle)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color("PrimaryYellow"))
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Button(action: action) {
                    Text(actionText)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color("PrimaryYellow"))
                        .foregroundColor(.black)
                        .cornerRadius(20)
                }
                .padding(.top, 4)
            }
            .padding(16)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
