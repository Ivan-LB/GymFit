//
//  SocialMediaView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct SocialMediaView: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(spacing: 30) {
            // Encabezado
            Text("Síguenos en Redes Sociales")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Text("Mantente al día con nuestras últimas promociones, eventos y consejos de fitness")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Botones de redes sociales
            HStack(spacing: 20) {
                SocialButton(
                    name: "Facebook",
                    icon: "facebook_icon", // Usar PDF personalizado
                    color: Color(red: 0.23, green: 0.35, blue: 0.6),
                    action: {
                        if let url = URL(string: "https://facebook.com/gymfit") {
                            openURL(url)
                        }
                    }
                )
                
                SocialButton(
                    name: "Instagram",
                    icon: "instagram_icon", // Usar PDF personalizado
                    color: Color(red: 0.8, green: 0.2, blue: 0.5),
                    action: {
                        if let url = URL(string: "https://instagram.com/gymfit") {
                            openURL(url)
                        }
                    }
                )
                
                SocialButton(
                    name: "Twitter",
                    icon: "twitter_icon", // Usar PDF personalizado
                    color: Color(red: 0.11, green: 0.63, blue: 0.95),
                    action: {
                        if let url = URL(string: "https://twitter.com/gymfit") {
                            openURL(url)
                        }
                    }
                )
            }
            .padding(.top)
            
            // Últimas publicaciones
            VStack(alignment: .leading, spacing: 15) {
                Text("Últimas Publicaciones")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(1...5, id: \.self) { _ in
                            SocialPostPreview()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
    }
}

struct SocialButton: View {
    var name: String
    var icon: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Image(icon) // Usar imagen PDF personalizada
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                
                Text(name)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .frame(width: 100, height: 100)
            .background(color)
            .cornerRadius(12)
        }
    }
}

struct SocialPostPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("post_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 150)
                .clipped()
                .cornerRadius(8)
            
            Text("Nuevo programa de entrenamiento")
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            Text("Hace 2 días")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 200)
    }
}
