//
//  LogoView.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

// Berisikan Tampilan UI Logo di Halaman Login dan Register
struct LogoView: View {
    var body: some View { // Body: UI Layout
        
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 70)
            
            Text("Selamat Datang")
                .foregroundColor(.white)
                .font(.system(size: 25))
                .fontWeight(.bold)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            LogoView()
        }
    }
}
