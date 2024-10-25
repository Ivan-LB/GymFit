//
//  HomeView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Carousel de Imágenes
                ImageCarousel()
                    .padding(.bottom)
                
                // Tarjeta de Credencial del Usuario
                CredentialCard(userName: viewModel.userName, userNumber: viewModel.userNumber, qrCodeImage: viewModel.qrCodeImage)
                    .padding(.bottom, 16)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
