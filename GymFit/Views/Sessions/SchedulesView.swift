//
//  SchedulesView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 30/08/24.
//

import SwiftUI

struct SchedulesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Horarios de Sesiones")
                    .font(.title)
                    .padding(.bottom)

                // Aquí puedes agregar un calendario o tabla simple con las sesiones
                ForEach(0..<10) { index in
                    HStack {
                        Text("Clase \(index + 1)")
                        Spacer()
                        Text("Hora: 7:00 AM")
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}


#Preview {
    SchedulesView()
}
