//
//  UpcomingClassCard.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct UpcomingClassCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Spinning")
                .font(.headline)
            
            Text("Hoy, 18:00 - 19:00")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.yellow)
                
                Text("Instructor: Carlos")
                    .font(.caption)
            }
        }
        .padding()
        .frame(width: 200)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
