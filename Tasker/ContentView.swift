//
//  ContentView.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

struct ContentView: View {
    
    // Menyambungkan dengan AuthViewModel dengan EnvironmentObject
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            // Single Time Login
            // Menyimpan Session agar ketika Aplikasi di Close, User tetep login
            if viewModel.userSession == nil {
                LogoView()
            } else {
                if let user = viewModel.currentUser {
                    DashboardView(user: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
