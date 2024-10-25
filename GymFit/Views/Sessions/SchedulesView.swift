//
//  SchedulesView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct SchedulesView: View {
    @State private var isImageFullScreen = false  // Estado para controlar si se muestra la imagen en pantalla completa
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Horarios de Sesiones")
                    .font(.title)
                    .padding(.bottom)

                // Imagen que representa los horarios (cuando el usuario haga tap, se expandirá)
                Button(action: {
                    isImageFullScreen.toggle()  // Abrir la imagen en pantalla completa
                }) {
                    Image("Sesiones")  // Asegúrate de que esta imagen está en tus assets
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .buttonStyle(PlainButtonStyle())  // Para que no se vea como un botón convencional

                // Aquí puedes agregar el calendario o la lista de sesiones
//                ForEach(0..<10) { index in
//                    HStack {
//                        Text("Clase \(index + 1)")
//                        Spacer()
//                        Text("Hora: 7:00 AM")
//                    }
//                    .padding()
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(10)
//                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isImageFullScreen, content: {
            FullScreenImageView(isPresented: $isImageFullScreen, imageName: "Sesiones")
        })
    }
}

struct FullScreenImageView: View {
    @Binding var isPresented: Bool
    var imageName: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()  // Fondo negro
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    isPresented.toggle()  // Cerrar la vista de pantalla completa cuando se haga tap en la imagen
                }
            
            Button(action: {
                isPresented.toggle()  // Botón para cerrar la vista
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    SchedulesView()
}
