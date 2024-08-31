//
//  GenericCard.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct CredentialCard: View {
    var userName: String
    var userNumber: String
    var qrCodeImage: Image?
    
    var body: some View {
        VStack() {
            Text(userName)
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.top)
            Text(userNumber)
                .font(.subheadline)
            QRCode(qrCodeImage: qrCodeImage)
                .padding(.bottom)
        }
        .padding(16)
        .frame(maxWidth: 360, maxHeight: 360)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    CredentialCard(userName: "Hola", userNumber: "Hola", qrCodeImage: nil)
}
