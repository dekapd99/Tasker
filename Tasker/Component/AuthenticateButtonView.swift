//
//  AuthenticateButtonView.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

struct AuthenticateButtonView: View {
    
    let text: String
    
    var body: some View {
        
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 360, height: 50)
            .background(Color.pink.opacity(0.7))
            .clipShape(Capsule())
    }
}

struct AuthenticateButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateButtonView(text: "Sign In")
    }
}
