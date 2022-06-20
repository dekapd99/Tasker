//
//  DashboardView.swift
//  Tasker
//
//  Created by Deka Primatio on 19/06/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    var body: some View {
        VStack {
            Text("DashboardView")
            Button {
                AuthViewModel.shared.signout()
            } label: {
                Text("Log Out")
            }
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
