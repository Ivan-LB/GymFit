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
                    
//                    Accesos rápidos
//                    FeaturesGridView()
                    
                    // Próximas clases
                    UpcomingClassesView()
                }
                .padding(.vertical)
            }
            .navigationTitle("GymFit")
        }
    }
}

#Preview {
    HomeView()
}
