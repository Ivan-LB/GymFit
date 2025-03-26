//
//  AuthenticationView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

// Vista principal de autenticación que contiene la navegación
struct AuthenticationView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            LoginView(isLoggedIn: $isLoggedIn)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
