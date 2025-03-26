//
//  QRScannerView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct QRScannerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var scannedCode: String?
    
    var body: some View {
        VStack {
            // Aquí iría la implementación del scanner de QR
            // Usando AVFoundation en un UIViewRepresentable
            
            // Placeholder para el ejemplo
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Escanea el código QR")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .foregroundColor(.yellow)
                    
                    if let code = scannedCode {
                        Text("Código: \(code)")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Button("Cancelar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.yellow)
                    .padding()
                }
            }
        }
    }
}
