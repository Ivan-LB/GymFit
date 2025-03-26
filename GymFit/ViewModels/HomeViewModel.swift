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
    // Datos del usuario
    @Published var userName: String = "IVAN LORENZANA"
    @Published var userNumber: String = "24671"
    @Published var qrCodeImage: Image?
    
    // Flag para indicar la fuente de datos
    @Published var isUsingHardcodedData: Bool = true
    
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()
    
    init(useHardcodedData: Bool = true) {
        self.isUsingHardcodedData = useHardcodedData
        
        if isUsingHardcodedData {
            // Usar datos hardcodeados
            self.userName = "IVAN LORENZANA"
            self.userNumber = "24671"
        } else {
            // Aquí iría la lógica para obtener datos de la base de datos
            loadUserDataFromDatabase()
        }
        
        // Generar QR code
        if let cachedImage = QRCodeCache.shared.getQRCode(for: userNumber) {
            self.qrCodeImage = cachedImage
        } else {
            generateQRCode()
        }
    }
    
    private func loadUserDataFromDatabase() {
        // Esta función se implementará en el futuro cuando se defina la base de datos
        // Por ahora, podemos dejar un placeholder
        print("Cargando datos de usuario desde la base de datos (pendiente de implementar)")
        
        // Temporalmente, podemos usar datos de ejemplo diferentes para distinguirlos
        self.userName = "USUARIO DB"
        self.userNumber = "DB12345"
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
    
    // Método para cambiar la fuente de datos (para pruebas)
    func toggleDataSource() {
        isUsingHardcodedData.toggle()
        
        if isUsingHardcodedData {
            self.userName = "IVAN LORENZANA"
            self.userNumber = "24671"
        } else {
            loadUserDataFromDatabase()
        }
        
        // Regenerar QR code con los nuevos datos
        generateQRCode()
    }
}

// Singleton para manejar el cache del QR
class QRCodeCache {
    static let shared = QRCodeCache()
    private init() {}
    
    private var cachedQRCodes: [String: Image] = [:]
    
    func getQRCode(for number: String) -> Image? {
        return cachedQRCodes[number]
    }
    
    func setQRCode(_ image: Image, for number: String) {
        cachedQRCodes[number] = image
    }
    
    func clearCache() {
        cachedQRCodes.removeAll()
    }
}
