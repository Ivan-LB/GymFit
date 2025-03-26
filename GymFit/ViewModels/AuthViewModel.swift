//
//  AuthViewModel.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginError: Bool = false
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var isAdmin: Bool = false
    @Published var rememberMe = false
    @Published var showPassword = false
    @Published var showForgotPassword = false
    
    // Credenciales hardcodeadas para el administrador
    private let adminEmail = "24617"
    private let adminPassword = "12345678"
    
    func attemptLogin() {
        isLoading = true
        loginError = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if self.email.lowercased() == self.adminEmail && self.password == self.adminPassword {
                print(self.adminEmail)
                print(self.password)
                self.isLoggedIn = true
                self.isAdmin = true // 👉 se marca como administrador
            } else {
                self.loginError = true
            }
            self.isLoading = false
        }
    }
}
