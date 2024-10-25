//
//  ImageCarousel.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 31/08/24.
//

import SwiftUI

struct ImageCarousel: View {
    let imagesNames: [String] = ["Prueba","Prueba","Prueba"]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing:0){
            TabView(selection:$currentIndex){
                ForEach(0..<imagesNames.count,id: \.self){ imageIndex in
                    Image(imagesNames[imageIndex])
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 180)
                        .cornerRadius(30)
                        .clipped()
                        .tag(imageIndex)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        }
        .frame(maxHeight: 180)
        .shadow(radius: 5)
        .onReceive(timer){_ in
            withAnimation {
                currentIndex = (currentIndex + 1) % imagesNames.count
            }
        }
    }
}

#Preview {
    ImageCarousel()
}
