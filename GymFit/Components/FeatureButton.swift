//
//  FeatureButton.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct FeatureButton: View {
    var icon: String
    var label: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.black)
        .cornerRadius(12)
    }
}

#Preview {
    FeatureButton(icon: "bell", label: "Hola")
}
