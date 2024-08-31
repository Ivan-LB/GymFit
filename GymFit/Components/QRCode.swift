//
//  QRCode.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct QRCode: View {
    var qrCodeImage: Image?
    
    var body: some View {
        if let qrCodeImage = qrCodeImage {
            qrCodeImage
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .background(Color("AppBackground"))
        } else {
            ProgressView()
        }
    }
}

#Preview {
    QRCode()
}
