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
            HStack {
                Text(userName)
                    .font(.largeTitle)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(Color("PrimaryYellow"))
            Text(userNumber)
                .font(.subheadline)
                .foregroundStyle(Color("AppBackground"))
            Spacer()
            QRCode(qrCodeImage: qrCodeImage)
                .padding(.bottom)
            Spacer()
        }
        .frame(maxWidth: 360, maxHeight: 360)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    CredentialCard(userName: "Hola", userNumber: "Hola", qrCodeImage: nil)
}
