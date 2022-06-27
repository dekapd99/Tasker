//
//  CustomSecureField.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

// Berisikan Custom Secure Field khusus untuk Input Forms Password
struct CustomSecureField: View {
    
    @Binding var text: String // Property Wrapper yang dapat Read / Write
    let placeholder: Text // Placeholder Text
    
    var body: some View { // Body: UI Layout
        
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                // Secure Text Input by User
                SecureField("", text: $text)
                    .autocapitalization(.none)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            CustomSecureField(text: .constant(""), placeholder: Text("Password"))
        }
    }
}
