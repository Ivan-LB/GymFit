//
//  UpcomingClassesView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

// Componente para próximas clases
struct UpcomingClassesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Próximas Clases")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<3) { _ in
                        UpcomingClassCard()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
