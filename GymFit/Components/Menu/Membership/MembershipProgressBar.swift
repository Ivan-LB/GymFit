//
//  MembershipProgressBar.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct MembershipProgressBar: View {
    var startDate: Date
    var endDate: Date
    
    var progress: CGFloat {
        let total = endDate.timeIntervalSince(startDate)
        let elapsed = Date().timeIntervalSince(startDate)
        return min(max(CGFloat(elapsed / total), 0), 1)
    }
    
    var daysRemaining: Int {
        let remaining = endDate.timeIntervalSince(Date())
        return max(Int(remaining / (60*60*24)), 0)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.white.opacity(0.3))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width * progress, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
            
            HStack {
                Text("\(daysRemaining) días restantes")
                    .font(.caption)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("\(Int(progress * 100))% completado")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
    }
}
