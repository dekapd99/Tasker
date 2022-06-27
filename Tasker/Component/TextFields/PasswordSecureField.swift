//
//  PasswordSecureField.swift
//  Tasker
//
//  Created by Deka Primatio on 16/06/22.
//

import SwiftUI

// Berisikan UI Forms Password Text Field
struct PasswordSecureField: View {
    
    @Binding var text: String  // Property Wrapper yang dapat Read / Write
    let placeholder: String // Placeholder Text
    
    var body: some View { // Body: UI Layout
        
        // Panggil CustomTextField
        CustomSecureField(text: $text, placeholder: Text(placeholder))
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct PasswordSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            PasswordSecureField(text: .constant(""), placeholder: "Password")
        }
    }
}
