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
    
    init() { // Konfigurasi Firebase di Main App sebagai Initializer
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Setup Environment Variabel agar bisa digunakan di Project ini
                .environmentObject(AuthViewModel.shared)
        }
    }
}
