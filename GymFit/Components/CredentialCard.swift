//
//  CredentialCard 2.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct CredentialCard: View {
    var userName: String
    var userNumber: String
    var qrCodeImage: Image?
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            // Frente de la tarjeta
            VStack(spacing: 0) {
                // Encabezado con nombre
                VStack(spacing: 5) {
                    Text(userName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal)
                        .padding(.top, 15)
                    
                    Text("Miembro Activo")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                    .padding(.vertical, 10)
                
                // QR Code
                QRCode(qrCodeImage: qrCodeImage)
                    .padding(.bottom, 10)
                
                // Número de miembro
                Text("# \(userNumber)")
                    .font(.headline)
                    .padding(.bottom, 15)
            }
            .frame(maxWidth: 300, maxHeight: 380)
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("PrimaryYellow"), lineWidth: 2)
            )
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .opacity(isFlipped ? 0 : 1)
            
            // Reverso de la tarjeta (información adicional)
            VStack(spacing: 15) {
                Image("gym_logo_placeholder") // Reemplazar con logo real
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                    .padding(.top, 20)
                
                VStack(spacing: 5) {
                    Text("GymFit")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Tu camino al éxito fitness")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    InfoRow(label: "Dirección", value: "Av. Principal #123")
                    InfoRow(label: "Teléfono", value: "123-456-7890")
                    InfoRow(label: "Horario", value: "Lun-Dom: 6:00 - 22:00")
                }
                .padding(.horizontal)
                
                Spacer()
                
                Text("Presenta esta credencial en recepción")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 15)
            }
            .frame(maxWidth: 300, maxHeight: 380)
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("PrimaryYellow"), lineWidth: 2)
            )
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .rotation3DEffect(
                .degrees(isFlipped ? 0 : 180),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .opacity(isFlipped ? 1 : 0)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isFlipped.toggle()
            }
        }
    }
}

struct InfoRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(width: 70, alignment: .leading)
            
            Text(value)
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}

struct QRCode: View {
    var qrCodeImage: Image?
    
    var body: some View {
        ZStack {
            if let qrImage = qrCodeImage {
                qrImage
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
            } else {
                // Placeholder mientras se genera el QR
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 180, height: 180)
                    .cornerRadius(10)
                
                ProgressView()
            }
        }
    }
}
