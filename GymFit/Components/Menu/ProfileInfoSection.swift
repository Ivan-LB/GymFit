//
//  ProfileInfoSection.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/03/25.
//

import SwiftUI

struct ProfileInfoSection: View {
    var title: String
    @Binding var isEditMode: Bool
    var fields: [ProfileField]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            VStack(spacing: 12) {
                ForEach(fields, id: \.label) { field in
                    HStack {
                        Image(systemName: field.icon)
                            .foregroundColor(Color("PrimaryYellow"))
                            .frame(width: 30)
                        
                        if isEditMode {
                            TextField(field.label, text: field.value)
                        } else {
                            Text(field.value.wrappedValue)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
    }
}
