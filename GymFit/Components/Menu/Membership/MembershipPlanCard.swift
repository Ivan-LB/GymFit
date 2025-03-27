//
//  MembershipPlanCard.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct MembershipPlanCard: View {
    var title: String
    var price: String
    var period: String
    var features: [String]
    var isRecommended: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            if isRecommended {
                Text("Recomendado")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color("PrimaryYellow"))
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .offset(y: -15)
            }
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(alignment: .firstTextBaseline) {
                Text(price)
                    .font(.system(size: 32, weight: .bold))
                
                Text(period)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(features, id: \.self) { feature in
                    HStack(alignment: .top) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 14))
                        
                        Text(feature)
                            .font(.subheadline)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            
            Button(action: {
                // Acción para seleccionar plan
            }) {
                Text("Seleccionar")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isRecommended ? Color("PrimaryYellow") : Color(.systemGray5))
                    .foregroundColor(isRecommended ? .black : .primary)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isRecommended ? Color("PrimaryYellow") : Color.gray.opacity(0.3), lineWidth: isRecommended ? 2 : 1)
        )
        .padding(.horizontal)
    }
}
