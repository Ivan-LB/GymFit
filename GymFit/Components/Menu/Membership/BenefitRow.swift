//
//  BenefitRow.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct BenefitRow: View {
    var icon: String
    var title: String
    var isIncluded: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(isIncluded ? Color("PrimaryYellow") : .gray)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(isIncluded ? .primary : .gray)
            
            Spacer()
            
            Image(systemName: isIncluded ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(isIncluded ? .green : .gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
