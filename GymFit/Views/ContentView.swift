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
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .tag("home")
            
            SchedulesView()
                .tabItem {
                    Label("Horarios", systemImage: "calendar")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .tag("schedules")
            
            WorkoutsView()
                .tabItem {
                    Label("Rutinas", systemImage: "figure.run")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .tag("workouts")
            
            MenuView()
                .tabItem {
                    Label("Menú", systemImage: "line.3.horizontal.circle.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .tag("menu")
        }
        .accentColor(.yellow)
    }
}


#Preview {
    ContentView()
}

//NavigationLink(destination: SocialMediaView()) {
//    FeatureButton(icon: "network", label: "Red Social")
//}
//NavigationLink(destination: CustomerServiceView()) {
//    FeatureButton(icon: "megaphone", label: "Atención")
//}
