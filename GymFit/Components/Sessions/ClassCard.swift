//
//  ClassCard.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

// Tarjeta para cada clase
struct ClassCard: View {
    var gymClass: GymClass
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(gymClass.name)
                    .font(.headline)
                Text(gymClass.instructor)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(gymClass.time)
                .font(.system(.headline, design: .monospaced))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.yellow.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(8)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
