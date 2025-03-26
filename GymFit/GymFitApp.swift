//
//  GymFitApp.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 26/08/24.
//

import SwiftUI
import SwiftData

@main
struct GymFitApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
            } else {
                AuthenticationView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
