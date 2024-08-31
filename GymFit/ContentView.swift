//
//  ContentView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .toolbarBackground(Color("PrimaryWhite"), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tag("home")
            SessionsView()
                .tabItem { Label("Sessions", systemImage: "figure.run") }
                .tag("sessions")
            MenuView()
                .tabItem { Label("Menu", systemImage: "line.3.horizontal.circle.fill") }
                .tag("Menu")
        }
        
    }
}

#Preview {
    ContentView()
}
