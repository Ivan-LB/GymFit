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
        VStack {
            CredentialCard(userName: viewModel.userName, userNumber: viewModel.userNumber, qrCodeImage: viewModel.qrCodeImage)
        }
    }
}

#Preview {
    HomeView()
}
