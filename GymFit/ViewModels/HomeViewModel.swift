//
//  HomeViewModel.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

class HomeViewModel: ObservableObject {
    @Published var userName: String = "IVAN LORENZANA"
    @Published var userNumber: String = "24671"
    @Published var qrCodeImage: Image?

    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()

    init() {
        if let cachedImage = QRCodeCache.shared.getQRCode(for: userNumber) {
            self.qrCodeImage = cachedImage
        } else {
            generateQRCode()
        }
    }

    func generateQRCode() {
        let data = Data(userNumber.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                let uiImage = UIImage(cgImage: cgimg)
                let swiftUIImage = Image(uiImage: uiImage)

                qrCodeImage = swiftUIImage
                QRCodeCache.shared.setQRCode(swiftUIImage, for: userNumber)
            }
        }
    }
}

// Singleton para manejar el cache del QR
class QRCodeCache {
    static let shared = QRCodeCache()
    private init() {}

    private var cachedQRCode: Image?

    func getQRCode(for number: String) -> Image? {
        return cachedQRCode
    }

    func setQRCode(_ image: Image, for number: String) {
        cachedQRCode = image
    }
}
