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

// Ejemplo de uso en HomeView
struct PromotionsCarousel: View {
    @State private var currentPromotion = 0
    
    let promotions = [
        (title: "50% de descuento en membresía anual", subtitle: "Solo por este mes", image: "promotion1_placeholder"),
        (title: "Nuevas clases de CrossFit", subtitle: "Inscríbete ahora", image: "promotion2_placeholder"),
        (title: "Evaluación física gratuita", subtitle: "Para miembros premium", image: "promotion3_placeholder")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Promociones")
                .font(.headline)
                .padding(.horizontal)
            
            TabView(selection: $currentPromotion) {
                ForEach(0..<promotions.count, id: \.self) { index in
                    PromotionCard(
                        title: promotions[index].title,
                        subtitle: promotions[index].subtitle,
                        backgroundImage: promotions[index].image
                    ) {
                        // Acción al hacer clic en la promoción
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .frame(height: 200)
            .padding(.horizontal)
        }
    }
}
