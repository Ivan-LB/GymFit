//
//  SignUpView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

// Vista de registro (ahora como vista navegable, no modal)
struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var isLoading = false
    @State private var acceptTerms = false
    @State private var passwordsMatch = true
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 25) {
                    Text("Crear Cuenta")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    // Campos de registro
                    VStack(spacing: 20) {
                        // Nombre
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nombre Completo")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                            
                            TextField("", text: $name)
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
                                .placeholder(when: name.isEmpty) {
                                    Text("Tu nombre")
                                        .foregroundColor(.white.opacity(0.5))
                                        .padding(.leading, 16)
                                }
                        }
                        
                        // Email
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
                        
                        // Contraseña
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Contraseña")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                            
                            HStack {
                                if showPassword {
                                    TextField("", text: $password)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("", text: $password)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .autocapitalization(.none)
                                }
                                
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.white.opacity(0.6))
                                }
                                .padding(.trailing, 8)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            )
                            .placeholder(when: password.isEmpty) {
                                Text("••••••••")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                        }
                        
                        // Confirmar Contraseña
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Confirmar Contraseña")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                            
                            HStack {
                                if showConfirmPassword {
                                    TextField("", text: $confirmPassword)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .autocapitalization(.none)
                                        .onChange(of: confirmPassword) { _ in
                                            passwordsMatch = password == confirmPassword || confirmPassword.isEmpty
                                        }
                                } else {
                                    SecureField("", text: $confirmPassword)
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .autocapitalization(.none)
                                        .onChange(of: confirmPassword) { _ in
                                            passwordsMatch = password == confirmPassword || confirmPassword.isEmpty
                                        }
                                }
                                
                                Button(action: {
                                    showConfirmPassword.toggle()
                                }) {
                                    Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.white.opacity(0.6))
                                }
                                .padding(.trailing, 8)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(passwordsMatch ? Color.white.opacity(0.2) : Color.red, lineWidth: 1)
                            )
                            .placeholder(when: confirmPassword.isEmpty) {
                                Text("••••••••")
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 16)
                            }
                            
                            if !passwordsMatch {
                                Text("Las contraseñas no coinciden")
                                    .font(.caption)
                                    .foregroundColor(.red)
                            }
                        }
                        
                        // Términos y condiciones
                        Button(action: {
                            acceptTerms.toggle()
                        }) {
                            HStack(alignment: .top) {
                                Image(systemName: acceptTerms ? "checkmark.square.fill" : "square")
                                    .foregroundColor(acceptTerms ? Color("PrimaryYellow") : .white.opacity(0.6))
                                    .padding(.top, 2)
                                
                                Text("Acepto los Términos y Condiciones y la Política de Privacidad")
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.8))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 30)
                    
                    // Botón de registro
                    Button(action: {
                        registerUser()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("PrimaryYellow"))
                            
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            } else {
                                Text("CREAR CUENTA")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(height: 56)
                    }
                    .disabled(isLoading || !isFormValid)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    .opacity(isFormValid ? 1.0 : 0.6)
                    
                    Spacer()
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        // Personalizar el botón de retroceso
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Atrás")
                    }
                    .foregroundColor(Color("PrimaryYellow"))
                }
            }
        }
    }
    
    private var isFormValid: Bool {
        !name.isEmpty &&
        !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count >= 6 &&
        password == confirmPassword &&
        acceptTerms
    }
    
    private func registerUser() {
        isLoading = true
        
        // Simulación de registro
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}
