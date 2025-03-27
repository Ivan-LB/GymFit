//
//  MenuRow.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct MenuRow: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.yellow)
                .frame(width: 30, height: 30)
            
            Text(title)
                .font(.body)
        }
        .padding(.vertical, 5)
    }
}
