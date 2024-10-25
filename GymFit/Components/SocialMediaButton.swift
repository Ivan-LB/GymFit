//
//  SocialMediaButton.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct SocialMediaButton: View {
    var icon: String
    var label: String
    var color: Color
    var url: URL
    
    var body: some View {
        Button(action: {
            openURL(url)
        }) {
            HStack {
                Image(icon)  // Aquí usamos el nombre del PDF en los Assets
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(label)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(minWidth: 150, maxWidth: .infinity, minHeight: 50)
            .background(color)
            .cornerRadius(10)
        }
    }
    
    func openURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SocialMediaButton(
        icon: "instagram",
        label: "Instagram",
        color: .red,
        url: URL(string: "https://www.google.com")!  // Asegúrate de que es un URL válido
    )
}
