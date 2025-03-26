//
//  HomeView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel(useHardcodedData: true)
    @State private var currentPromotion = 0
    @State private var showQRScanner = false
    
    let promotions = ["Promoción de Verano", "Nuevo Equipo", "Clases Especiales"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Tarjeta de credencial con QR
                    CredentialCard(
                        userName: viewModel.userName,
                        userNumber: viewModel.userNumber,
                        qrCodeImage: viewModel.qrCodeImage
                    )
                    .padding(.horizontal)
                    
                    // Indicador de fuente de datos (solo para desarrollo)
                    #if DEBUG
                    HStack {
                        Text("Fuente de datos: \(viewModel.isUsingHardcodedData ? "Hardcoded" : "Base de datos")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            viewModel.toggleDataSource()
                        }) {
                            Text("Cambiar")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.yellow.opacity(0.2))
                                .cornerRadius(4)
                        }
                    }
                    .padding(.horizontal)
                    #endif
                    
                    // Carrusel de promociones
                    TabView(selection: $currentPromotion) {
                        ForEach(0..<promotions.count, id: \.self) { index in
                            PromotionCard(title: promotions[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 200)
                    .padding(.horizontal)
                    
                    // Accesos rápidos
                    FeaturesGridView()
                    
                    // Próximas clases
                    UpcomingClassesView()
                }
                .padding(.vertical)
            }
            .navigationTitle("GymFit")
            .sheet(isPresented: $showQRScanner) {
                QRScannerView()
            }
        }
    }
}

// Componente para la cuadrícula de características
struct FeaturesGridView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Accesos Rápidos")
                .font(.headline)
                .padding(.horizontal)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                NavigationLink(destination: Text("Reservar Clase")) {
                    FeatureButton(icon: "calendar.badge.plus", label: "Reservar Clase")
                }
                
                NavigationLink(destination: Text("Mi Progreso")) {
                    FeatureButton(icon: "chart.bar.fill", label: "Mi Progreso")
                }
                
                NavigationLink(destination: SocialMediaView()) {
                    FeatureButton(icon: "network", label: "Red Social")
                }
                
                NavigationLink(destination: CustomerServiceView()) {
                    FeatureButton(icon: "megaphone", label: "Atención")
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FeatureButton: View {
    var icon: String
    var label: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.yellow)
            
            Text(label)
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Componente para próximas clases
struct UpcomingClassesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Próximas Clases")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { _ in
                        UpcomingClassCard()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct UpcomingClassCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Spinning")
                .font(.headline)
            
            Text("Hoy, 18:00 - 19:00")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.yellow)
                
                Text("Instructor: Carlos")
                    .font(.caption)
            }
            
            Text("5 lugares disponibles")
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.green.opacity(0.2))
                .cornerRadius(4)
        }
        .padding()
        .frame(width: 200)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    HomeView()
}
