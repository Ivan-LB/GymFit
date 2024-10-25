//
//  SocialMediaView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 24/10/24.
//

import SwiftUI

struct SocialMediaView: View {
    var body: some View {
        VStack(spacing: 20) {
            Link(destination: URL(string: "https://instagram.com")!) {
                SocialMediaButton(label: "Instagram")
            }
            Link(destination: URL(string: "https://facebook.com")!) {
                SocialMediaButton(label: "Facebook")
            }
            Link(destination: URL(string: "https://gym.com/cancelacion")!) {
                SocialMediaButton(label: "Cancelar Membresía")
            }
        }
        .navigationTitle("Red Social")
        .padding()
    }
}

#Preview {
    SocialMediaView()
}
