//
//  LoginView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

// Vista de Login
struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack {
            // Fondo negro
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Logo
                VStack(spacing: 15) {
                    Image("logofit2020") // Usar el ícono que compartiste
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                .padding(.top, 60)
                
                Spacer()
                
                // Formulario de login
                VStack(spacing: 25) {
                    // Campo de email
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                        
                        TextField("tu@email.com", text: $viewModel.email)
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
                    }
                    
                    // Campo de contraseña
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Contraseña")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                        
                        HStack {
                            if viewModel.showPassword {
                                TextField("", text: $viewModel.password)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("", text: $viewModel.password)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .autocapitalization(.none)
                            }
                            
                            Button(action: {
                                viewModel.showPassword.toggle()
                            }) {
                                Image(systemName: viewModel.showPassword ? "eye.slash.fill" : "eye.fill")
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
                        .placeholder(when: viewModel.password.isEmpty) {
                            Text("••••••••")
                                .foregroundColor(.white.opacity(0.5))
                                .padding(.leading, 16)
                        }
                    }
                    
                    // Opciones adicionales
                    HStack {
                        // Recordarme
                        Button(action: {
                            viewModel.rememberMe.toggle()
                        }) {
                            HStack {
                                Image(systemName: viewModel.rememberMe ? "checkmark.square.fill" : "square")
                                    .foregroundColor(viewModel.rememberMe ? Color("PrimaryYellow") : .white.opacity(0.6))
                                
                                Text("Recordarme")
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                        
                        Spacer()
                        
                        // Olvidé mi contraseña
                        Button(action: {
                            viewModel.showForgotPassword = true
                        }) {
                            Text("¿Olvidaste tu contraseña?")
                                .font(.footnote)
                                .foregroundColor(Color("PrimaryYellow"))
                        }
                    }
                    .padding(.horizontal, 4)
                    
                    // Mensaje de error (si existe)
                    if viewModel.loginError {
                        Text("Email o contraseña incorrectos")
                            .font(.footnote)
                            .foregroundColor(.red)
                            .padding(.top, -10)
                    }
                    
                    // Botón de inicio de sesión
                    Button(action: {
                        viewModel.attemptLogin()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color("PrimaryYellow"))
                            
                            if viewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            } else {
                                Text("INICIAR SESIÓN")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(height: 56)
                    }
                    .disabled(viewModel.isLoading)
                    .padding(.top, 10)
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                // Opción para registrarse - Ahora usando NavigationLink
                HStack {
                    Text("¿No tienes una cuenta?")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Regístrate")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryYellow"))
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.showForgotPassword) {
            ForgotPasswordView()
        }
        .onChange(of: viewModel.isLoggedIn) { oldValue, newValue in
            isLoggedIn = newValue
        }
    }
}

// Vista previa
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(isLoggedIn: .constant(false))
    }
}
