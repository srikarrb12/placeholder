//
//  ContentView.swift
//  SmartPantry
//
//  Created by Long Lam on 3/4/24.
//

import AVFoundation
import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        TabView {
            PantryView()
                .tabItem { Label("Home", systemImage: "house") }
            CameraView()
                .tabItem { Label("Scan", systemImage: "camera.metering.matrix") }
            NotificationView()
                .tabItem { Label("Notification", systemImage: "bell") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .accentColor(.red)
        .frame(minWidth: 300, maxWidth: .infinity,
               minHeight: 300, maxHeight: .infinity)
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(.white)
            UITabBar.appearance().unselectedItemTintColor =
                UIColor(white: 0.1, alpha: 0.7)
        }
    }
}

#Preview {
    ContentView()
}
