//
//  ForgotPasswordView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

// Vista de recuperación de contraseña (se mantiene como modal)
struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var isLoading = false
    @State private var isEmailSent = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 25) {
                    Image(systemName: "lock.rotation")
                        .font(.system(size: 70))
                        .foregroundColor(Color("PrimaryYellow"))
                        .padding(.top, 50)
                    
                    Text("Recuperar Contraseña")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                        
                        TextField("", text: $email)
                            .font(.body)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            )
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .placeholder(when: email.isEmpty) {
                                Text("tu@email.com")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    
                    Button(action: {
                        sendResetEmail()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("PrimaryYellow"))
                            
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            } else {
                                Text("ENVIAR ENLACE")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(height: 56)
                    }
                    .disabled(isLoading || email.isEmpty)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    
                    if isEmailSent {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            
                            Text("Enlace enviado. Revisa tu correo.")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 10)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    private func sendResetEmail() {
        isLoading = true
        
        // Simulación de envío de correo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isEmailSent = true
            isLoading = false
        }
    }
}
