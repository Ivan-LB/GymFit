//
//  PromotionsCarousel.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

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
