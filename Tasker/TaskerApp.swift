//
//  TaskerApp.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI
import Firebase

@main
struct TaskerApp: App {
    
    init() { // Konfigurasi Firebase di Main App
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
