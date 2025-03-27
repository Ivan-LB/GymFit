//
//  PaymentHistoryRow.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct PaymentHistoryRow: View {
    var date: String
    var amount: String
    var status: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(date)
                    .font(.subheadline)
                
                Text(status)
                    .font(.caption)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Text(amount)
                .font(.headline)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
