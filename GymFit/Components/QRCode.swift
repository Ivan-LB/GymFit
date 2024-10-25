//
//  QRCode.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct QRCode: View {
    var qrCodeImage: Image?
    
    @State private var isRevealed = false
    @State private var originalBrightness: CGFloat = UIScreen.main.brightness
    
    var body: some View {
        VStack {
            if isRevealed {
                if let qrCodeImage = qrCodeImage {
                    qrCodeImage
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .padding()
                        .background(Color("AppBackground"))
                } else {
                    ProgressView()
                }
            } else {
                Text("Tap to reveal")
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation {
                            isRevealed = true
                            originalBrightness = UIScreen.main.brightness
                            UIScreen.main.brightness = 1.0
                        }
                    }
            }
        }
        .frame(width: 250, height: 250)
    }
}

#Preview {
    QRCode(qrCodeImage: Image(systemName: "qrcode"))
}

