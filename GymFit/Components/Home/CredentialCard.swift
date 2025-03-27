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
            .frame(maxWidth: .infinity, maxHeight: 380)
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
                Image("logofit2020") // Reemplazar con logo real
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 180)
                
                VStack(spacing: 5) {
                    Text("GymFit")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Divider()
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    InfoRow(label: "Dirección", value: "Av de los Insurgentes 18015, Rio Tijuana 3ra Etapa, 22226 Tijuana, B.C.")
                    InfoRow(label: "Teléfono", value: "664-900-0014")
                    InfoRow(label: "Horario", value: "Lun-Jueves: 5:00am - 22:50pm\n" +
                            "Viernes: 5:00am - 20:50pm\n" +
                            "Sábado: 7:00am - 3:50pm\n" +
                            "Domingo: Cerrado")
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: 380)
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
                    .frame(maxWidth: 230, maxHeight: 230)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
            } else {
                // Placeholder mientras se genera el QR
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(maxWidth: 230, maxHeight: 230)
                    .cornerRadius(10)
                
                ProgressView()
            }
        }
    }
}
